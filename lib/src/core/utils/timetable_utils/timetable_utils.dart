import 'lesson_status/lesson_status.dart';

class TimetableUtils {
  /// Определяет учебный год (начинается 1 сентября)
  static DateTime getAcademicYearStart(DateTime date) {
    final septemberThisYear = DateTime(date.year, 9, 1);
    return date.isBefore(septemberThisYear)
        ? DateTime(date.year - 1, 9, 1)
        : septemberThisYear;
  }

  /// Определяет номер недели от начала учебного года (1 = нечётная)
  static int getWeekNumberFromAcademicStart(DateTime date) {
    final academicStart = getAcademicYearStart(date);
    final diff = date.difference(academicStart).inDays;
    return (diff ~/ 7) + 1;
  }

  /// Проверяет, чётная ли неделя (2, 4, 6...)
  static bool isEvenWeek(DateTime date) {
    return getWeekNumberFromAcademicStart(date).isEven;
  }

  /// Парсит время из строки "8:30-10:05" → (начало, конец)
  static (DateTime start, DateTime end) parseLessonTime(
      String timeRange,
      DateTime referenceDate,
      ) {
    final parts = timeRange.split('-');
    final startParts = parts[0].trim().split(':');
    final endParts = parts[1].trim().split(':');

    final start = DateTime(
      referenceDate.year,
      referenceDate.month,
      referenceDate.day,
      int.parse(startParts[0]),
      int.parse(startParts[1]),
    );

    final end = DateTime(
      referenceDate.year,
      referenceDate.month,
      referenceDate.day,
      int.parse(endParts[0]),
      int.parse(endParts[1]),
    );

    return (start, end);
  }

  /// Определяет статус пары относительно текущего времени
  static LessonStatus getLessonStatus(String timeRange, DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final (start, end) = parseLessonTime(timeRange, today);

    // Проверяем, что сейчас тот же день
    if (now.isBefore(today) || now.isAfter(today.add(const Duration(days: 1)))) {
      return const LessonStatus.notToday();
    }

    // До начала пары
    if (now.isBefore(start)) {
      final minutes = start.difference(now).inMinutes;
      return LessonStatus.willStartIn(minutes: minutes);
    }

    // После окончания пары
    if (now.isAfter(end)) {
      return const LessonStatus.finished();
    }

    // Во время пары: 45 мин + 5 мин перерыв + 45 мин
    final firstHalfEnd = start.add(const Duration(minutes: 50)); // 45 + 5

    if (now.isBefore(firstHalfEnd)) {
      // Идёт первая половина или перерыв
      final minutes = now.difference(start).inMinutes;
      return LessonStatus.inProgress(minutes: minutes);
    } else {
      // Вторая половина
      final minutesLeft = end.difference(now).inMinutes;
      return LessonStatus.willEndIn(minutes: minutesLeft);
    }
  }

  /// Форматирует статус пары для отображения (без локализации)
  static String formatLessonStatus(LessonStatus status) {
    return status.when(
        notToday: () => '',
        finished: () => '',
        willStartIn: (minutes) => minutes == 1 ? 'Начнётся через 1 минуту' : 'Начнётся через $minutes минут',
        inProgress: (minutes) => minutes == 1 ? 'Идёт 1 минуту' : 'Идёт $minutes минут',
        willEndIn: (minutes) => minutes == 1 ? 'Закончится через 1 минуту' : 'Закончится через $minutes минут',
    );
  }
}