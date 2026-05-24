import 'package:sfu/src/feature/timetable/domain/use_case/get_next_lesson_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/entity/week/week.dart';

class GetNextLessonUseCaseImpl implements GetNextLessonUseCase {
  const GetNextLessonUseCaseImpl();

  @override
  NextLessonResult call({required Timetable timetable, required DateTime now}) {
    final currentWeekNumber = _currentWeekNumber(now);
    final Week week = currentWeekNumber == 1
        ? timetable.week1
        : timetable.week2;

    final todayWeekday = now.weekday; // 1=пн … 6=сб, 7=вс
    if (todayWeekday == 7) return const NoLessonsToday();

    final todayLessons = week.lessons
        .where((l) => l.day == todayWeekday)
        .toList()
      ..sort((a, b) => a.timeStart.compareTo(b.timeStart));

    if (todayLessons.isEmpty) return const NoLessonsToday();

    for (int i = 0; i < todayLessons.length; i++) {
      final lesson = todayLessons[i];
      final start = _parseTime(lesson.timeStart, now);
      final end = _parseTime(lesson.timeEnd, now);

      // Идёт первые 50 минут (45 мин пара + 5 мин перерыв)
      final firstHalfEnd = start.add(const Duration(minutes: 50));

      if (now.isAfter(start) && now.isBefore(firstHalfEnd)) {
        final minutesGone = now.difference(start).inMinutes;
        return LessonInProgress(lesson: lesson, minutesGone: minutesGone);
      }

      // Пара ещё не началась
      if (now.isBefore(start)) {
        final minutesLeft = start.difference(now).inMinutes;

        // Показываем только если это первая пара дня (за 90 мин)
        // или если уже идёт учебный день (предыдущая пара в процессе/прошла)
        final isFirstLesson = i == 0;
        if (isFirstLesson && minutesLeft > 90) {
          // Слишком рано — не показываем
          return const NoLessonsToday();
        }

        return LessonUpcoming(lesson: lesson, minutesLeft: minutesLeft);
      }

      // Пара уже закончилась (now >= end) — продолжаем к следующей
    }

    // Все пары прошли
    return const NoMoreLessonsToday();
  }

  DateTime _parseTime(String time, DateTime ref) {
    final parts = time.split(':');
    return DateTime(
      ref.year, ref.month, ref.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  /// Номер учебной недели: нечётная=1, чётная=2
  int _currentWeekNumber(DateTime date) {
    final academicStart = _academicYearStart(date);
    final weeks = date.difference(academicStart).inDays ~/ 7;
    return (weeks % 2 == 0) ? 1 : 2;
  }

  DateTime _academicYearStart(DateTime date) {
    final sep = DateTime(date.year, 9, 1);
    return date.isBefore(sep) ? DateTime(date.year - 1, 9, 1) : sep;
  }
}