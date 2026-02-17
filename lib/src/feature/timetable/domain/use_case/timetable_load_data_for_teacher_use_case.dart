import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableLoadDataForTeacherUseCase {
  Future<Timetable> call();
}