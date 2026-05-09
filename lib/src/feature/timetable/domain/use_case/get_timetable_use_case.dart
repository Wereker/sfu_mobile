import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';

abstract class GetTimetableUseCase {
  Future<Timetable> call({String? target});
}