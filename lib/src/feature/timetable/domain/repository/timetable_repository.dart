import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableRepository {
  Future<Timetable> getTimetable();
  Future<Timetable> getTimetableForTarget(String target);
}