import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

/// Результат вычисления ближайшей пары
sealed class NextLessonResult {
  const NextLessonResult();
}

/// Пара идёт прямо сейчас (первые 50 минут)
class LessonInProgress extends NextLessonResult {
  final Lesson lesson;
  final int minutesGone; // сколько минут идёт
  const LessonInProgress({required this.lesson, required this.minutesGone});
}

/// Следующая пара начнётся через N минут
class LessonUpcoming extends NextLessonResult {
  final Lesson lesson;
  final int minutesLeft;
  const LessonUpcoming({required this.lesson, required this.minutesLeft});
}

/// Все пары сегодня закончились
class NoMoreLessonsToday extends NextLessonResult {
  const NoMoreLessonsToday();
}

/// Сегодня пар нет
class NoLessonsToday extends NextLessonResult {
  const NoLessonsToday();
}

abstract class GetNextLessonUseCase {
  NextLessonResult call({required Timetable timetable, required DateTime now});
}

