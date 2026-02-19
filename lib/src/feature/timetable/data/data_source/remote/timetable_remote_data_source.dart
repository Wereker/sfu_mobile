import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';

abstract class TimetableRemoteDataSource {
  Future<TimetableDTO> getTimetableForGroup(String group, String subgroup);

  Future<TimetableDTO> getTimetableForTeacher(String teacher);

  Future<TimetableDTO> getTimetableForTarget(String target);
}