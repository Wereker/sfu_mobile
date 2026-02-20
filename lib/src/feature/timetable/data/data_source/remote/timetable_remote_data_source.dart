import 'package:sfu/src/feature/timetable/data/DTO/timetable_dto/timetable_dto.dart';

abstract class TimetableRemoteDataSource {
  Future<TimetableDTO> getTimetableForTarget(String target);
}