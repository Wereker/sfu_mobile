import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/chat/presentation/screens/chat_screen.dart';
import 'package:sfu/src/feature/department/presentation/screens/department_screen.dart';
import 'package:sfu/src/feature/qr/presentation/screens/qr_screen.dart';
import 'package:sfu/src/feature/timetable/presentation/screens/timetable_screen.dart';

import '../../feature/attendance/presentation/screens/attendance_screen.dart';
import '../../feature/management/presentation/screens/management_screen.dart';
import '../../feature/profile/presentation/bloc/profile_bloc.dart';
import '../widgets/announcement_card.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isTeacher = state.maybeWhen(
          success: (user) => user.role == 'teacher',
          orElse: () => false,
        );

        final pages = isTeacher
            ? _teacherPages()
            : _studentPages();

        final destinations = isTeacher
            ? _teacherDestinations()
            : _studentDestinations();

        return Scaffold(
          body: IndexedStack(index: _currentIndex, children: pages),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (i) =>
                setState(() => _currentIndex = i),
            destinations: destinations,
          ),
        );
      },
    );
  }

  List<Widget> _studentPages() => [
    _HomeBody(onTabChange: (i) => setState(() => _currentIndex = i)),
    const TimetableScreen(),
    const QrScreen(),
    const ChatScreen(),
    const DepartmentScreen(),
  ];

  List<Widget> _teacherPages() => [
    _HomeBody(onTabChange: (i) => setState(() => _currentIndex = i)),
    const TimetableScreen(),
    const AttendanceScreen(),
    const ChatScreen(),
    const ManagementScreen(),
  ];

  List<NavigationDestination> _studentDestinations() => const [
    NavigationDestination(icon: Icon(Icons.home_outlined),             selectedIcon: Icon(Icons.home),              label: 'Главная'),
    NavigationDestination(icon: Icon(Icons.calendar_month_outlined),   selectedIcon: Icon(Icons.calendar_month),    label: 'Расписание'),
    NavigationDestination(icon: Icon(Icons.qr_code_scanner_outlined),  selectedIcon: Icon(Icons.qr_code_scanner),   label: 'QR'),
    NavigationDestination(icon: Icon(Icons.chat_bubble_outline),       selectedIcon: Icon(Icons.chat_bubble),       label: 'Чат'),
    NavigationDestination(icon: Icon(Icons.school_outlined),           selectedIcon: Icon(Icons.school),            label: 'Кафедра'),
  ];

  List<NavigationDestination> _teacherDestinations() => const [
    NavigationDestination(icon: Icon(Icons.home_outlined),             selectedIcon: Icon(Icons.home),              label: 'Главная'),
    NavigationDestination(icon: Icon(Icons.calendar_month_outlined),   selectedIcon: Icon(Icons.calendar_month),    label: 'Расписание'),
    NavigationDestination(icon: Icon(Icons.fact_check_outlined),       selectedIcon: Icon(Icons.fact_check),        label: 'Журнал'),
    NavigationDestination(icon: Icon(Icons.chat_bubble_outline),       selectedIcon: Icon(Icons.chat_bubble),       label: 'Чат'),
    NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), selectedIcon: Icon(Icons.admin_panel_settings), label: 'Управление'),
  ];
}

// Временная заглушка для других экранов
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(label, style: Theme.of(context).textTheme.titleLarge));
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.onTabChange});
  final ValueChanged<int> onTabChange;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        //AppBar
        _HomeAppBar(cs: cs, ext: ext, tt: tt),

        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Следующая пара
              const SizedBox(height: 4),
              _NextClassCard(cs: cs, ext: ext, tt: tt),

              // Быстрые действия
              const SizedBox(height: 12),
              _QuickActions(cs: cs, ext: ext, tt: tt, onTabChange: onTabChange),

              // События кафедры
              const SizedBox(height: 20),
              _SectionHeader(
                title: 'События кафедры',
                moreLabel: 'Все',
                ext: ext,
                tt: tt,
              ),
              const SizedBox(height: 8),
              _EventsRow(cs: cs, ext: ext, tt: tt),

              // Объявления
              const SizedBox(height: 20),
              _SectionHeader(title: 'Объявления', ext: ext, tt: tt),
              const SizedBox(height: 8),
              _AnnouncementsList(cs: cs, ext: ext, tt: tt),
            ]),
          ),
        ),
      ],
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 0,
      toolbarHeight: 72,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.primary,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'АИ', // инициалы пользователя
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: cs.onPrimary,
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Привет, Алексей ',
                        style: tt.displaySmall,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'понедельник, 4 мая',
                      style: tt.labelLarge?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/logo_app_bar.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextClassCard extends StatelessWidget {
  const _NextClassCard({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: ext.surfaceTinted,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          // pinned left accent
          border: Border(left: BorderSide(color: cs.primary, width: 3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхняя строка: «СЛЕДУЮЩАЯ ПАРА» + бейдж
            Row(
              children: [
                Text(
                  'СЛЕДУЮЩАЯ ПАРА',
                  style: tt.labelSmall?.copyWith(
                    color: ext.textOnTinted,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                _StatusBadge(
                  label: 'Через 40 мин',
                  tone: _BadgeTone.warning,
                  ext: ext,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Название предмета
            Text('Машинное обучение', style: tt.titleMedium),

            const SizedBox(height: 4),

            // Время и аудитория
            Text(
              '10:30 — 12:05 · ауд. Л4-21',
              style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
            ),

            const SizedBox(height: 12),

            // Преподаватель
            Row(
              children: [
                _InitialsAvatar(
                  name: 'Соколова Елена',
                  size: 32,
                  primary: cs.primary,
                ),
                const SizedBox(width: 8),
                Text('Соколова Е. В.', style: tt.labelLarge),
                const SizedBox(width: 4),
                Text(
                  '· доц., к.т.н.',
                  style: tt.labelLarge?.copyWith(
                    color: ext.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({
    required this.cs,
    required this.ext,
    required this.tt,
    required this.onTabChange,
  });
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final ValueChanged<int> onTabChange;

  static const _actions = [
    (icon: Icons.calendar_month_outlined, label: 'Расписание', tabIndex: 1),
    (icon: Icons.qr_code_scanner_outlined, label: 'QR', tabIndex: 2),
    (icon: Icons.campaign_outlined, label: 'Новости', tabIndex: -1),
    (icon: Icons.chat_bubble_outline, label: 'Чат', tabIndex: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: _actions.map((a) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: a == _actions.last ? 0 : 10),
              child: _QuickChip(
                icon: a.icon,
                label: a.label,
                cs: cs,
                ext: ext,
                tt: tt,
                onTap: a.tabIndex >= 0 ? () => onTabChange(a.tabIndex) : null,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({
    required this.icon,
    required this.label,
    required this.cs,
    required this.ext,
    required this.tt,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cs.surface,
      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ext.border),
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: cs.primary, size: 22),
              const SizedBox(height: 6),
              Text(
                label,
                style: tt.labelLarge?.copyWith(fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventsRow extends StatelessWidget {
  const _EventsRow({required this.cs, required this.ext, required this.tt});
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: sampleEvents.length,
        itemBuilder: (_, i) => EventCard(event: sampleEvents[i]),
      ),
    );
  }
}

class _AnnouncementsList extends StatelessWidget {
  const _AnnouncementsList({
    required this.cs,
    required this.ext,
    required this.tt,
  });
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    // Закреплённые — первыми, остальные — по порядку
    final sorted = [
      ...sampleAnnouncements.where((a) => a.isPinned),
      ...sampleAnnouncements.where((a) => !a.isPinned),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: sorted
            .map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AnnouncementCard(announcement: a),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    this.moreLabel,
    required this.ext,
    required this.tt,
  });
  final String title;
  final String? moreLabel;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title, style: tt.titleMedium),
          if (moreLabel != null) ...[
            const Spacer(),
            Text(
              moreLabel!,
              style: tt.labelLarge?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

enum _BadgeTone { success, warning, error, neutral }

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.tone,
    required this.ext,
  });
  final String label;
  final _BadgeTone tone;
  final AppColors ext;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    switch (tone) {
      case _BadgeTone.success:
        bg = ext.successBg;
        fg = ext.successFg;
      case _BadgeTone.warning:
        bg = ext.warningBg;
        fg = ext.warningFg;
      case _BadgeTone.error:
        bg = ext.errorBg;
        fg = ext.errorFg;
      case _BadgeTone.neutral:
        bg = ext.divider;
        fg = ext.textSecondary;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: fg,
          height: 1,
        ),
      ),
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({
    required this.name,
    required this.size,
    required this.primary,
  });
  final String name;
  final double size;
  final Color primary;

  static const _hues = [
    Color(0xFFFF9900),
    Color(0xFFFFB84D),
    Color(0xFFE68A00),
    Color(0xFFCC7A00),
    Color(0xFFFFA726),
    Color(0xFFFB8C00),
  ];

  String get _initials => name
      .split(' ')
      .where((p) => p.isNotEmpty)
      .take(2)
      .map((p) => p[0])
      .join()
      .toUpperCase();

  Color get _bg {
    int h = 0;
    for (final c in name.codeUnits) {
      h = (h * 31 + c) & 0x7FFFFFFF;
    }
    return _hues[h % _hues.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _bg),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: size * 0.36,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}
