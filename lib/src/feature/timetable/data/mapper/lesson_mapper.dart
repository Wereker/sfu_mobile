import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';
import 'package:sfu/src/feature/timetable/domain/entity/lesson/lesson.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/entity/week/week.dart';

abstract class TimetableMapper {
  static Timetable fromDTO(TimetableDTO dto) => Timetable(
    groupId: int.parse(dto.groupId),
    week1: WeekMapper.fromDTO(dto.weeks.firstWhere((w) => w.week == '1')),
    week2: WeekMapper.fromDTO(dto.weeks.firstWhere((w) => w.week == '2')),
  );
}

abstract class WeekMapper {
  static Week fromDTO(WeekDTO dto) => Week(
    number: int.parse(dto.week),
    lessons: dto.lessons
        .map(LessonMapper.fromDTO)
        .toList()
      ..sort((a, b) {
        final dayCompare = a.day.compareTo(b.day);
        if (dayCompare != 0) return dayCompare;
        return a.timeStart.compareTo(b.timeStart);
      }),
  );
}

abstract class LessonMapper {
  static Lesson fromDTO(LessonDTO dto) => Lesson(
    id: int.parse(dto.id),
    groupId: int.parse(dto.groupId),
    teacherId: dto.teacherId,
    teacherName: dto.teacherName ?? '',
    day: int.parse(dto.day),
    timeStart: dto.timeStart,
    timeEnd: dto.timeEnd,
    subject: dto.subject,
    type: _parseType(dto.lessonType),
    room: dto.room,
    building: dto.building,
    isOnline: dto.building.toUpperCase() == 'ЭИОС',
  );

  static LessonType _parseType(String raw) {
    switch (raw.toLowerCase()) {
      case 'лекция':       return LessonType.lecture;
      case 'пр. занятие':  return LessonType.practice;
      case 'лаб. работа':  return LessonType.lab;
      default:             return LessonType.unknown;
    }
  }
}
