import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/DTO/week_dto/week_dto.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';

part 'week.freezed.dart';

@freezed
abstract class Week with _$Week {
  const factory Week({required String week, required List<Lesson> lessons}) =
      _Week;

  static Week fromDTO(WeekDTO dto) => Week(
    week: dto.week,
    lessons: dto.lessons.map((lesson) => Lesson.fromDTO(lesson)).toList(),
  );
}
