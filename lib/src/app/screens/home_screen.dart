import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/feature/announcements/presentation/bloc/announcements_bloc.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/screens/timetable_screen.dart';
import 'package:sfu/src/feature/qr/presentation/screens/qr_screen.dart';
import 'package:sfu/src/feature/chat/presentation/screens/chat_screen.dart';
import 'package:sfu/src/feature/department/presentation/screens/department_screen.dart';
import 'package:sfu/src/feature/attendance/presentation/screens/attendance_screen.dart';
import 'package:sfu/src/feature/management/presentation/screens/management_screen.dart';

import 'home/home_body.dart';
import 'home/home_loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChange(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
  }

  bool _isLoading(
      ProfileState profile,
      AnnouncementsState announcements,
      EventsState events,
      ) {
    final profileDone = profile.maybeWhen(
      success: (_) => true, error: (_) => true, orElse: () => false,
    );
    final annDone = announcements.maybeWhen(
      success: (_) => true, error: (_) => true, orElse: () => false,
    );
    final eventsDone = events.maybeWhen(
      success: (_) => true, error: (_) => true, orElse: () => false,
    );
    return !(profileDone && annDone && eventsDone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
          builder: (context, annState) {
            return BlocBuilder<EventsBloc, EventsState>(
              builder: (context, eventsState) {
                if (_isLoading(
                  profileState, annState, eventsState,
                )) {
                  return const HomeLoadingScreen();
                }

                final isTeacher = profileState.maybeWhen(
                  success: (u) =>
                  u.role == UserRole.teacher ||
                      u.role == UserRole.admin,
                  orElse: () => false,
                );

                final pages = isTeacher
                    ? _teacherPages()
                    : _studentPages();
                final destinations = isTeacher
                    ? _teacherDestinations()
                    : _studentDestinations();

                return Scaffold(
                  body: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (i) {
                      if (_currentIndex != i) {
                        setState(() => _currentIndex = i);
                      }
                    },
                    children: pages,
                  ),
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: _currentIndex,
                    onDestinationSelected: _onTabChange,
                    destinations: destinations,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  List<Widget> _studentPages() => [
    HomeBody(onTabChange: _onTabChange),
    const TimetableScreen(),
    const QrScreen(),
    const ChatScreen(),
    const DepartmentScreen(),
  ];

  List<Widget> _teacherPages() => [
    HomeBody(onTabChange: _onTabChange),
    const TimetableScreen(),
    const AttendanceScreen(),
    const ChatScreen(),
    const ManagementScreen(),
  ];

  List<NavigationDestination> _studentDestinations() => const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Главная',
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month),
      label: 'Расписание',
    ),
    NavigationDestination(
      icon: Icon(Icons.qr_code_scanner_outlined),
      selectedIcon: Icon(Icons.qr_code_scanner),
      label: 'QR',
    ),
    NavigationDestination(
      icon: Icon(Icons.chat_bubble_outline),
      selectedIcon: Icon(Icons.chat_bubble),
      label: 'Чат',
    ),
    NavigationDestination(
      icon: Icon(Icons.school_outlined),
      selectedIcon: Icon(Icons.school),
      label: 'Кафедра',
    ),
  ];

  List<NavigationDestination> _teacherDestinations() => const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Главная',
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month),
      label: 'Расписание',
    ),
    NavigationDestination(
      icon: Icon(Icons.fact_check_outlined),
      selectedIcon: Icon(Icons.fact_check),
      label: 'Журнал',
    ),
    NavigationDestination(
      icon: Icon(Icons.chat_bubble_outline),
      selectedIcon: Icon(Icons.chat_bubble),
      label: 'Чат',
    ),
    NavigationDestination(
      icon: Icon(Icons.admin_panel_settings_outlined),
      selectedIcon: Icon(Icons.admin_panel_settings),
      label: 'Управление',
    ),
  ];
}