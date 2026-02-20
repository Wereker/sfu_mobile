import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableLoadDataForTargetUseCase {
  Future<Timetable> call(String target);
}