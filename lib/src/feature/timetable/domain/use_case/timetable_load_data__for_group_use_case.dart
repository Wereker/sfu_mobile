import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableLoadDataForGroupUseCase {
  Future<Timetable> call();
}