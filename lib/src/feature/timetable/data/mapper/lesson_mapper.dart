import 'package:sfu/src/feature/timetable/data/DTO/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';

abstract class LessonMapper {
  static Lesson fromDTO(LessonDTO dto) => Lesson(
    id:        dto.id,
    day:       dto.day,
    time:      '${dto.timeStart}-${dto.timeEnd}',
    teacher:   dto.teacher,
    teacherId: dto.teacherId,
    subject:   dto.subject,
    type:      dto.type,
    place:     dto.place,
    building:  dto.building,
    groups:    dto.groups,
    sync:      dto.sync,
  );
}