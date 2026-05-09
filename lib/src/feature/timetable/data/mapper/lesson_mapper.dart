import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/entity/week/week.dart';

abstract class LessonMapper {
  static Lesson fromDTO(LessonDTO dto) => Lesson(
    id: dto.id,
    day: dto.day,
    time: '${dto.timeStart}-${dto.timeEnd}',
    teacher: dto.teacher,
    teacherId: dto.teacherId,
    subject: dto.subject,
    type: dto.type,
    place: dto.place,
    building: dto.building,
    groups: dto.groups,
    sync: dto.sync,
  );
}

abstract class WeekMapper {
  static Week fromDTO(WeekDTO dto) => Week(
    week: dto.week,
    lessons: dto.lessons.map(LessonMapper.fromDTO).toList(),
  );
}

abstract class TimetableMapper {
  static Timetable fromDTO(TimetableDTO dto) => Timetable(
    target: dto.target,
    type: dto.type,
    institute: dto.institute ?? '',
    weeks: dto.weeks.map(WeekMapper.fromDTO).toList(),
  );
}
