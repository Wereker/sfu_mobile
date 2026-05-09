import 'package:sfu/src/feature/timetable/data/dto/timetable_dto/timetable_dto.dart';

abstract class TimetableRemoteDataSource {
  Future<TimetableDTO> getTimetableForTarget(String target);
}