part of '../screens/timetable_screen.dart';

class _LessonItem extends StatelessWidget {
  final Lesson lesson;
  final int index;
  final bool isLast;

  const _LessonItem({
    required this.lesson,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        index.toString(),
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
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
          const SizedBox(height: 10),
          if (lesson.teacher.isNotEmpty || lesson.groups.isNotEmpty || lesson.place.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Левая часть: преподаватель ИЛИ колонка групп
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
                        .map((group) => Text(
                      group,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
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
          if (!isLast) const Divider(),
        ],
      ),
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
}
