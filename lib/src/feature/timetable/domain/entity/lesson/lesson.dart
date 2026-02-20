import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/DTO/lesson_dto/lesson_dto.dart';

part 'lesson.freezed.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required String day,
    required String time,
    required String teacher,
    required String subject,
    required String type,
    required String place,
    required String building,
    required List<String> groups,
    required String sync,
  }) = _Lesson;

  static Lesson fromDTO(LessonDTO dto) => Lesson(
    day: dto.day,
    time: dto.time,
    teacher: dto.teacher,
    subject: dto.subject,
    type: dto.type,
    place: dto.place,
    building: dto.building,
    groups:  dto.groups,
    sync: dto.sync,
  );
}
