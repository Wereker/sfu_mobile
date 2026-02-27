part of '../screens/timetable_screen.dart';

class _TimetableContent extends StatelessWidget {
  const _TimetableContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableBloc, TimetableState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const _LoadingContent(),
          success: (timetable) => _TimetableContentState(timetable: timetable),
          error: (message) => const _ErrorContent(),
          orElse: () => const _EmptyContent(),
        );
      },
    );
  }
}

class _LoadingContent extends StatelessWidget {
  const _LoadingContent();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TimetableSearchBar(),
              ),
            ),
          ),
          SliverFillRemaining(child: Center(child: LoadingIndicatorWidget())),
        ],
      ),
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TimetableSearchBar(),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '${t!.timetableError}: Не удалось загрузить расписание',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyContent extends StatelessWidget {
  const _EmptyContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TimetableSearchBar(),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                t!.timetableNotFoundData,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimetableContentState extends StatefulWidget {
  final Timetable timetable;

  const _TimetableContentState({required this.timetable});

  @override
  State<_TimetableContentState> createState() => _TimetableContentStateState();
}

class _TimetableContentStateState extends State<_TimetableContentState> {
  String _selectedWeek = '1';
  DateTime _currentTime = DateTime.now();
  Timer? _timeUpdateTimer;

  @override
  void initState() {
    super.initState();

    final isEven = TimetableUtils.isEvenWeek(DateTime.now());
    setState(() => _selectedWeek = isEven ? '2' : '1');

    _startTimeUpdater();
  }

  @override
  void dispose() {
    _timeUpdateTimer?.cancel();
    super.dispose();
  }

  void _startTimeUpdater() {
    _timeUpdateTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        final now = DateTime.now();
        if (now.minute != _currentTime.minute ||
            now.hour != _currentTime.hour ||
            now.day != _currentTime.day) {
          setState(() => _currentTime = now);
        }
      }
    });
  }

  Future<void> _refreshTimetable() async {
    context.read<TimetableBloc>().add(TimetableEvent.loadData());

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final week = widget.timetable.weeks.firstWhere(
          (w) => w.week == _selectedWeek,
      orElse: () => widget.timetable.weeks.first,
    );
    final lessonsByDay = _groupLessonsByDay(week.lessons);

    return RefreshIndicator(
      onRefresh: _refreshTimetable,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TimetableSearchBar(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    'Расписание ${widget.timetable.target}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildWeekToggleButtons(),
                  const SizedBox(height: 16),
                  if (lessonsByDay.isEmpty)
                    Center(
                      child: Text(
                        t!.timetableNoLessonsThisWeek,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  else
                    ..._buildDayCards(
                      lessonsByDay,
                      _currentTime,
                    ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<int, List<Lesson>> _groupLessonsByDay(List<Lesson> lessons) {
    final grouped = <int, List<Lesson>>{};
    for (int day = 1; day <= 7; day++) {
      grouped[day] = [];
    }

    for (final lesson in lessons) {
      final day = int.tryParse(lesson.day) ?? 0;
      if (day >= 1 && day <= 7) {
        grouped[day]!.add(lesson);
      }
    }
    return grouped;
  }

  List<Widget> _buildDayCards(
      Map<int, List<Lesson>> lessonsByDay,
      DateTime now,
      ) {
    final sortedDays = lessonsByDay.keys.toList()..sort();
    final currentDay = now.weekday;
    final isCurrentWeek = _isCurrentWeek(now);

    return sortedDays
        .where((dayNumber) => dayNumber != 7)
        .map((dayNumber) {
      final lessons = lessonsByDay[dayNumber]!;
      final isToday = isCurrentWeek && (dayNumber == currentDay);

      return _DayLessonsCard(
        dayNumber: dayNumber,
        lessons: lessons,
        isToday: isToday,
        now: now,
      );
    }).toList();
  }

  bool _isCurrentWeek(DateTime now) {
    final actualWeekNumber = TimetableUtils.getWeekNumberFromAcademicStart(now);
    final isActualEven = actualWeekNumber.isEven;

    return (_selectedWeek == '1' && !isActualEven) ||
        (_selectedWeek == '2' && isActualEven);
  }

  Widget _buildWeekToggleButtons() {
    final t = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildWeekButton(
            label: t!.timetableOddWeek,
            week: '1',
            isSelected: _selectedWeek == '1',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          _buildWeekButton(
            label: t.timetableEvenWeek,
            week: '2',
            isSelected: _selectedWeek == '2',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekButton({
    required String label,
    required String week,
    required bool isSelected,
    required BorderRadius borderRadius,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: isSelected
              ? Colors.orange.withValues(alpha: 0.1)
              : Colors.transparent,
          foregroundColor: isSelected ? Colors.orange : Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide.none,
          ),
        ),
        onPressed: () => setState(() => _selectedWeek = week),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
