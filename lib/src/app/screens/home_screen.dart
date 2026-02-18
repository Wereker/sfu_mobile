import 'package:flutter/material.dart';
import 'package:sfu/src/app/widgets/app_navigation_bar.dart';
import 'package:sfu/src/app/widgets/custom_app_bar.dart';
import 'package:sfu/src/feature/timetable/presentation/screens/timetable_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Scaffold(body: const Center(child: Text("Список новостей"))),
    const TimetableScreen(),
    Scaffold(body: const Center(child: Text("Чат"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
