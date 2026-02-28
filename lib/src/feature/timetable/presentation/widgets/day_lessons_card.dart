part of '../screens/timetable_screen.dart';

class _DayLessonsCard extends StatelessWidget {
  final int dayNumber;
  final List<Lesson> lessons;
  final bool isToday;
  final DateTime now;

  const _DayLessonsCard({
    required this.dayNumber,
    required this.lessons,
    this.isToday = false,
    required this.now,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isToday
            ? BorderSide(color: Colors.orange, width: 1)
            : BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      color: isToday
          ? Colors.orange.withValues(alpha: 0.1)
          : Colors.transparent,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: isToday
                ? BoxDecoration(
                    color: Colors.orange.withValues(alpha: .1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  )
                : null,
            child: Center(
              child: Text(
                _getDayWithDate(context, dayNumber),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isToday ? Colors.orange : null,
                ),
              ),
            ),
          ),
          if (lessons.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.timetableNoLessonsThisDay,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            )
          else
            ...lessons.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final isLast = entry.key == lessons.length - 1;
              final isFirstLesson = entry.key == 0;

              return _LessonItem(
                lesson: entry.value,
                index: index,
                isLast: isLast,
                now: now,
                isToday: isToday,
                isFirstLesson: isFirstLesson,
              );
            }),
        ],
      ),
    );
  }

  String _getDayWithDate(BuildContext context, int dayNumber) {
    final today = DateTime.now();
    final diff = dayNumber - today.weekday;
    final targetDate = today.add(Duration(days: diff));
    return '${_getDayName(context, dayNumber)}, ${DateFormat('d.0M').format(targetDate)}';
  }

  String _getDayName(BuildContext context, int day) {
    final t = AppLocalizations.of(context);

    switch (day) {
      case 1:
        return t!.timetableMonday;
      case 2:
        return t!.timetableTuesday;
      case 3:
        return t!.timetableWednesday;
      case 4:
        return t!.timetableThursday;
      case 5:
        return t!.timetableFriday;
      case 6:
        return t!.timetableSaturday;
      case 7:
        return t!.timetableSunday;
      default:
        return '${t!.timetableDay} $day';
    }
  }
}
