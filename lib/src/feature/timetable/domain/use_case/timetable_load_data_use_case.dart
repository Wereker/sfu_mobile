import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class TimetableLoadDataUseCase {
  Future<Timetable> call();
}