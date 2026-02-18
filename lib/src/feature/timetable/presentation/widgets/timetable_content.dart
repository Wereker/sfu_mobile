part of '../screens/timetable_screen.dart';

class _TimetableContent extends StatefulWidget {
  final Timetable timetable;

  const _TimetableContent({required this.timetable});

  @override
  State<_TimetableContent> createState() => _TimetableContentState();
}

class _TimetableContentState extends State<_TimetableContent> {
  String _selectedWeek = '1';

  @override
  Widget build(BuildContext context) {
    final week = widget.timetable.weeks.firstWhere(
      (w) => w.week == _selectedWeek,
      orElse: () => widget.timetable.weeks.first,
    );
    final lessonsByDay = _groupLessonsByDay(week.lessons);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Кнопки переключения недель
        _buildWeekToggleButtons(),
        const SizedBox(height: 16),

        // Список дней с занятиями
        if (lessonsByDay.isEmpty)
          const Center(
            child: Text(
              'На этой неделе занятий нет',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
        else
          ..._buildDayCards(lessonsByDay),
          SizedBox(height: MediaQuery.of(context).padding.bottom,)
      ],
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

  List<Widget> _buildDayCards(Map<int, List<Lesson>> lessonsByDay) {
    final sortedDays = lessonsByDay.keys.toList()..sort();

    return sortedDays.map((dayNumber) {
      final lessons = lessonsByDay[dayNumber]!;
      return _DayLessonsCard(dayNumber: dayNumber, lessons: lessons);
    }).toList();
  }

  Widget _buildWeekToggleButtons() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildWeekButton(
            label: 'нечетная',
            week: '1',
            isSelected: _selectedWeek == '1',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          _buildWeekButton(
            label: 'четная',
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
