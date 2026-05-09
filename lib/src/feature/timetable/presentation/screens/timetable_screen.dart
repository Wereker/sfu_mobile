import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/utils/timetable_utils/lesson_status/lesson_status.dart';
import 'package:sfu/src/core/utils/timetable_utils/timetable_utils.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/widgets/timetable_search_bar.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<TimetableBloc>()..add(TimetableEvent.loadData()),
        ),
        BlocProvider(
          create: (_) =>
              di.sl<SuggestionsBloc>()..add(SuggestionEvent.loadData()),
        ),
      ],
      child: const Scaffold(body: _TimetableContent()),
    );
  }
}

class _TimetableContent extends StatelessWidget {
  const _TimetableContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableBloc, TimetableState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const _LoadingView(),
          success: (timetable) => _TimetableBody(timetable: timetable),
          error: (_) => const _ErrorView(),
          orElse: () => const _EmptyView(),
        );
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          _TimetableAppBar(target: ''),
          const SliverFillRemaining(
            child: Center(child: LoadingIndicatorWidget()),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          _TimetableAppBar(target: ''),
          SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: ext.errorBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wifi_off_outlined,
                        size: 28,
                        color: ext.errorFg,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Не удалось загрузить расписание',
                      textAlign: TextAlign.center,
                      style: tt.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Проверь подключение и попробуй снова',
                      textAlign: TextAlign.center,
                      style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          _TimetableAppBar(target: ''),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Расписание не найдено',
                style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimetableAppBar extends StatelessWidget {
  const _TimetableAppBar({required this.target});
  final String target;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    final today = DateTime.now();
    final subtitle = DateFormat('EEEE, d MMMM', 'ru').format(today);

    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      expandedHeight: 72,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Заголовок + подзаголовок
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Расписание', style: tt.displaySmall),
                    const SizedBox(height: 2),
                    Text(
                      target.isNotEmpty ? target : subtitle,
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

class _TimetableBody extends StatefulWidget {
  const _TimetableBody({required this.timetable});
  final Timetable timetable;

  @override
  State<_TimetableBody> createState() => _TimetableBodyState();
}

class _TimetableBodyState extends State<_TimetableBody> {
  late String _selectedWeek;
  late int _selectedDay; // 1 = пн … 6 = сб
  DateTime _now = DateTime.now();
  Timer? _timer;

  late final PageController _dayScrollController;

  @override
  void initState() {
    super.initState();
    final isEven = TimetableUtils.isEvenWeek(_now);
    _selectedWeek = isEven ? '2' : '1';

    final wd = _now.weekday;
    _selectedDay = (wd >= 1 && wd <= 6) ? wd : 1;

    _dayScrollController = PageController(
      viewportFraction: 1 / 7,
      initialPage: _selectedDay - 1,
    );

    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _dayScrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    context.read<TimetableBloc>().add(TimetableEvent.loadData());
    await Future.delayed(const Duration(seconds: 3));
  }

  Map<int, List<Lesson>> _groupByDay(List<Lesson> lessons) {
    final map = {for (int d = 1; d <= 6; d++) d: <Lesson>[]};
    for (final l in lessons) {
      final d = int.tryParse(l.day) ?? 0;
      if (d >= 1 && d <= 6) map[d]!.add(l);
    }
    return map;
  }

  static const _dowShort = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];

  DateTime _dateForWeekday(int wd) {
    final today = DateTime(_now.year, _now.month, _now.day);
    return today.add(Duration(days: wd - today.weekday));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ext = Theme.of(context).extension<AppColors>()!;
    final tt = Theme.of(context).textTheme;

    final week = widget.timetable.weeks.firstWhere(
      (w) => w.week == _selectedWeek,
      orElse: () => widget.timetable.weeks.first,
    );
    final byDay = _groupByDay(week.lessons);
    final dayLessons = byDay[_selectedDay] ?? [];

    final actualWeekNum = TimetableUtils.getWeekNumberFromAcademicStart(_now);
    final isCurrentWeek =
        (_selectedWeek == '1' && actualWeekNum.isOdd) ||
        (_selectedWeek == '2' && actualWeekNum.isEven);
    final isToday = isCurrentWeek && (_selectedDay == _now.weekday);

    return RefreshIndicator(
      color: cs.primary,
      onRefresh: _onRefresh,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            _TimetableAppBar(target: widget.timetable.target),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: TimetableSearchBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: _WeekPill(
                      selected: _selectedWeek,
                      onChanged: (w) => setState(() => _selectedWeek = w),
                      cs: cs,
                      ext: ext,
                      tt: tt,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: List.generate(6, (i) {
                        final wd = i + 1;
                        final date = _dateForWeekday(wd);
                        final isActive = wd == _selectedDay;
                        final isCurrentDay =
                            isCurrentWeek && wd == _now.weekday;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: _DayChip(
                              dow: _dowShort[i],
                              num: date.day,
                              isActive: isActive,
                              hasClasses: (byDay[wd] ?? []).isNotEmpty,
                              isCurrentDay: isCurrentDay,
                              cs: cs,
                              ext: ext,
                              tt: tt,
                              onTap: () => setState(() => _selectedDay = wd),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              sliver: dayLessons.isEmpty
                  ? SliverToBoxAdapter(
                      child: _EmptyDay(ext: ext, tt: tt),
                    )
                  : SliverList.separated(
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemCount: dayLessons.length,
                      itemBuilder: (_, i) => _LessonCard(
                        lesson: dayLessons[i],
                        index: i + 1,
                        isToday: isToday,
                        now: _now,
                        cs: cs,
                        ext: ext,
                        tt: tt,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekPill extends StatelessWidget {
  const _WeekPill({
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String selected;
  final ValueChanged<String> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ext.surfaceTinted,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PillSegment(
            label: 'Нечётная',
            value: '1',
            selected: selected,
            onChanged: onChanged,
            cs: cs,
            ext: ext,
            tt: tt,
          ),
          _PillSegment(
            label: 'Чётная',
            value: '2',
            selected: selected,
            onChanged: onChanged,
            cs: cs,
            ext: ext,
            tt: tt,
          ),
        ],
      ),
    );
  }
}

class _PillSegment extends StatelessWidget {
  const _PillSegment({
    required this.label,
    required this.value,
    required this.selected,
    required this.onChanged,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final String label, value, selected;
  final ValueChanged<String> onChanged;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selected;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? cs.surface : cs.surface.withValues(alpha: 0),
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Text(
          label,
          style: tt.labelLarge?.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? ext.textPrimary : ext.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.dow,
    required this.num,
    required this.isActive,
    required this.hasClasses,
    required this.isCurrentDay,
    required this.cs,
    required this.ext,
    required this.tt,
    required this.onTap,
  });

  final String dow;
  final int num;
  final bool isActive, hasClasses, isCurrentDay;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isActive ? cs.primary : cs.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: isActive
                ? cs.primary
                : isCurrentDay
                ? cs.primary.withValues(alpha: .4)
                : ext.border,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dow,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1,
                letterSpacing: 0.4,
                color: isActive ? cs.onPrimary : ext.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$num',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1,
                color: isActive ? cs.onPrimary : ext.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            // Точка — есть ли занятия
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasClasses
                    ? (isActive
                          ? cs.onPrimary.withValues(alpha: .7)
                          : cs.primary)
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyDay extends StatelessWidget {
  const _EmptyDay({required this.ext, required this.tt});
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Icon(Icons.coffee_outlined, size: 40, color: ext.textTertiary),
          const SizedBox(height: 12),
          Text(
            'Занятий нет, отдыхай',
            style: tt.bodyMedium?.copyWith(color: ext.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({
    required this.lesson,
    required this.index,
    required this.isToday,
    required this.now,
    required this.cs,
    required this.ext,
    required this.tt,
  });

  final Lesson lesson;
  final int index;
  final bool isToday;
  final DateTime now;
  final ColorScheme cs;
  final AppColors ext;
  final TextTheme tt;

  String _lessonIndex(String time) {
    const map = {
      '8:30-10:05': '1',
      '10:15-11:50': '2',
      '12:00-13:35': '3',
      '14:10-15:45': '4',
      '15:55-17:30': '5',
      '17:40-19:15': '6',
    };
    return map[time] ?? '$index';
  }

  Color _typeBg(AppColors e) {
    switch (lesson.type) {
      case 'лекция':
        return e.infoBg;
      case 'пр. занятие':
        return e.successBg;
      case 'лаб. работа':
        return e.warningBg;
      default:
        return e.divider;
    }
  }

  Color _typeFg(AppColors e) {
    switch (lesson.type) {
      case 'лекция':
        return e.infoFg;
      case 'пр. занятие':
        return e.successFg;
      case 'лаб. работа':
        return e.warningFg;
      default:
        return e.textSecondary;
    }
  }

  Color _statusBg(LessonStatus s, AppColors e) => s.maybeWhen(
    inProgress: (_) => e.successBg,
    willEndIn: (_) => e.warningBg,
    willStartIn: (_) => e.infoBg,
    orElse: () => e.divider,
  );

  Color _statusFg(LessonStatus s, AppColors e) => s.maybeWhen(
    inProgress: (_) => e.successFg,
    willEndIn: (_) => e.warningFg,
    willStartIn: (_) => e.infoFg,
    orElse: () => e.textSecondary,
  );

  bool _showStatus(LessonStatus s, bool isFirst) => s.when(
    notToday: () => false,
    finished: () => false,
    willStartIn: (_) => isFirst,
    inProgress: (_) => true,
    willEndIn: (_) => true,
  );

  @override
  Widget build(BuildContext context) {
    final status = isToday
        ? TimetableUtils.getLessonStatus(lesson.time, now)
        : const LessonStatus.notToday();
    final statusText = TimetableUtils.formatLessonStatus(status);
    final showStatus = _showStatus(status, index == 1) && statusText.isNotEmpty;

    final sBg = _statusBg(status, ext);
    final sFg = _statusFg(status, ext);

    final isInProgress = status.maybeWhen(
      inProgress: (_) => true,
      orElse: () => false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isInProgress ? ext.surfaceTinted : cs.surface,
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              border: Border.all(color: ext.border),
            ),
            padding: const EdgeInsets.fromLTRB(19, 14, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isToday ? sBg : ext.divider,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _lessonIndex(lesson.time),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          color: isToday ? sFg : ext.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),

                    if (lesson.type.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: _typeBg(ext),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          lesson.type,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color: _typeFg(ext),
                          ),
                        ),
                      ),

                    const Spacer(),

                    // Время
                    Text(
                      lesson.time,
                      style: tt.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isToday ? sFg : ext.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ── Название предмета ────────────────────────
                Text(
                  lesson.subject,
                  style: tt.titleMedium?.copyWith(fontSize: 15),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // ── Бейдж статуса ────────────────────────────
                if (showStatus) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: sBg,
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: sFg,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 10),

                // ── Преподаватель / группы + место ───────────
                if (lesson.teacher.isNotEmpty ||
                    lesson.groups.isNotEmpty ||
                    lesson.place.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: lesson.teacher.isNotEmpty
                            ? _MetaRow(
                                icon: Icons.person_outline,
                                label: lesson.teacher,
                                ext: ext,
                                tt: tt,
                              )
                            : _MetaRow(
                                icon: Icons.groups_outlined,
                                label: lesson.groups
                                    .where((g) => g.isNotEmpty)
                                    .join(', '),
                                ext: ext,
                                tt: tt,
                              ),
                      ),
                      if (lesson.place.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        _MetaRow(
                          icon: Icons.location_on_outlined,
                          label: lesson.place.length > 30
                              ? lesson.building
                              : lesson.place,
                          ext: ext,
                          tt: tt,
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          ),

          // ── Left accent border (идёт сейчас) ───────────────
          if (isInProgress)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: 3, color: cs.primary),
            ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════
// Строка метаданных (иконка + текст)
// ════════════════════════════════════════════════════════════
class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.label,
    required this.ext,
    required this.tt,
  });

  final IconData icon;
  final String label;
  final AppColors ext;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: ext.textTertiary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            style: tt.labelLarge?.copyWith(
              color: ext.textSecondary,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
