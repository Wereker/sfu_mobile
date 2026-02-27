part of '../screens/timetable_screen.dart';

class _LessonItem extends StatelessWidget {
  final Lesson lesson;
  final int index;
  final bool isLast;
  final bool isToday;
  final DateTime now;
  final bool isFirstLesson;

  const _LessonItem({
    required this.lesson,
    required this.index,
    required this.isLast,
    required this.now,
    required this.isToday,
    required this.isFirstLesson,
  });

  @override
  Widget build(BuildContext context) {
    final status = isToday
        ? TimetableUtils.getLessonStatus(lesson.time, now)
        : const LessonStatus.notToday();
    final statusText = TimetableUtils.formatLessonStatus(status);
    final showStatus = statusText.isNotEmpty && isToday && _shouldShowStatus(status);
    final statusColor = _getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: isToday ? statusColor : Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        _getLessonIndex(lesson.time),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (lesson.type.isNotEmpty)
                    Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: _getBackgroundColor(lesson.type),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        lesson.type,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                lesson.time,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isToday
                      ? statusColor
                      : Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  lesson.subject,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
          // Статус пары под предметом (если есть)
          if (showStatus)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          if (lesson.teacher.isNotEmpty ||
              lesson.groups.isNotEmpty ||
              lesson.place.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: lesson.teacher.isNotEmpty
                      ? Text(
                          lesson.teacher,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: lesson.groups
                              .where((g) => g.isNotEmpty)
                              .map(
                                (group) => Text(
                                  group,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                              .toList(),
                        ),
                ),
                if (lesson.place.isNotEmpty)
                  Text(
                    lesson.place.length > 30 ? lesson.building : lesson.place,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          if (!isLast) Divider(
            color: isToday ? Colors.orange : Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(LessonStatus status) {
    return status.maybeWhen(
      willEndIn: (_) => Colors.blue,
      inProgress: (_) => Colors.green,
      orElse: () => Colors.grey,
    );
  }

  Color _getBackgroundColor(String type) {
    switch (type) {
      case 'лекция':
        return Colors.orange;
      case 'пр. занятие':
        return Colors.green;
      case 'лаб. работа':
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }

  bool _shouldShowStatus(LessonStatus status) {
    return status.when(
      notToday: () => false,
      finished: () => false,
      willStartIn: (minutes) => isFirstLesson,
      inProgress: (minutes) => true,
      willEndIn: (minutes) => true,
    );
  }
  
  String _getLessonIndex(String time) {
    switch (time) {
      case '8:30-10:05':
        return '1';
      case '10:15-11:50':
        return '2';
      case '12:00-13:35':
        return '3';
      case '14:10-15:45':
        return '4';
      case '15:55-17:30':
        return '5';
      case '17:40-19:15':
        return '6';
      default:
        return index.toString();
    }
  }
}
