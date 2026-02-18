part of '../screens/timetable_screen.dart';

class _DayLessonsCard extends StatelessWidget {
  final int dayNumber;
  final List<Lesson> lessons;

  const _DayLessonsCard({required this.dayNumber, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                _getDayWithDate(dayNumber),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          if (lessons.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Сегодня пар нет',
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

  String _getDayWithDate(int dayNumber) {
    final today = DateTime.now();
    final diff = (dayNumber - today.weekday + 7) % 7;
    final targetDate = today.add(Duration(days: diff));
    return '${_getDayName(dayNumber)}, ${DateFormat('d.0M').format(targetDate)}';
  }

  String _getDayName(int day) {
    switch (day) {
      case 1:
        return 'Понедельник';
      case 2:
        return 'Вторник';
      case 3:
        return 'Среда';
      case 4:
        return 'Четверг';
      case 5:
        return 'Пятница';
      case 6:
        return 'Суббота';
      case 7:
        return 'Воскресенье';
      default:
        return 'День $day';
    }
  }
}