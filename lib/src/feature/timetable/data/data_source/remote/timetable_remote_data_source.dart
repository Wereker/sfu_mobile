import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';

abstract class TimetableRemoteDataSource {
  Future<TimetableDTO> getTimetableForGroup(int groupId);

  Future<TimetableDTO> getTimetableForTeacher(int teacherId);

  Future<TimetableDTO> getTimetableForTarget({
    required int targetId,
    required TimetableTargetType type,
  });
}

enum TimetableTargetType { group, teacher }
