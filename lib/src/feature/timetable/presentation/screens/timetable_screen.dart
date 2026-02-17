import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/dependency_injection/injection.dart' as di;
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:intl/intl.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<TimetableBloc>()..add(TimetableEvent.loadDataForGroup()),
      child: Scaffold(
        body: BlocBuilder<TimetableBloc, TimetableState>(
          builder: (BuildContext context, TimetableState state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              success: (timetable) => _TimetableContent(timetable: timetable),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Ошибка: $message', textAlign: TextAlign.center),
                  ],
                ),
              ),
              orElse: () => const Center(child: Text('Нет данных')),
            );
          },
        ),
      ),
    );
  }
}

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
    return Row(
      children: [
        _buildWeekButton(
          label: 'нечетная',
          week: '1',
          isSelected: _selectedWeek == '1',
        ),
        _buildWeekButton(
          label: 'четная',
          week: '2',
          isSelected: _selectedWeek == '2',
        ),
      ],
    );
  }

  Widget _buildWeekButton({
    required String label,
    required String week,
    required bool isSelected,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: isSelected
              ? Colors.orange.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.1),
          foregroundColor: isSelected ? Colors.orange : Colors.grey[800],
          shape: const RoundedRectangleBorder(),
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
          if (lesson.place.isNotEmpty) const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lesson.teacher,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                lesson.place,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
