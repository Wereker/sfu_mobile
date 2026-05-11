import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/utils/timetable_utils/timetable_utils.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/day_chip_widget.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/empty_day_widget.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/lesson_card_widget.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/timetable_app_bar.dart';
import 'package:sfu/src/feature/timetable/presentation/widgets/week_pill_widget.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/widgets/timetable_search_bar.dart';

class TimetableBody extends StatefulWidget {
  const TimetableBody({super.key, required this.timetable});
  final Timetable timetable;

  @override
  State<TimetableBody> createState() => _TimetableBodyState();
}

class _TimetableBodyState extends State<TimetableBody> {
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
            TimetableAppBar(target: widget.timetable.target),

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
                    child: WeekPill(
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
                            child: DayChip(
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
                child: EmptyDay(ext: ext, tt: tt),
              )
                  : SliverList.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: dayLessons.length,
                itemBuilder: (_, i) => LessonCard(
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