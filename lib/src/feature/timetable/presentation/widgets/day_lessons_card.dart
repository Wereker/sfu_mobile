part of '../screens/timetable_screen.dart';

class _DayLessonsCard extends StatelessWidget {
  final int dayNumber;
  final List<Lesson> lessons;

  const _DayLessonsCard({required this.dayNumber, required this.lessons});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                _getDayWithDate(context, dayNumber),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          if (lessons.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  t!.timetableNoLessonsThisDay,
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
              return _LessonItem(
                lesson: entry.value,
                index: index,
                isLast: isLast,
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