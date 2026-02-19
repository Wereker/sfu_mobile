import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case.dart';

class TimetableLoadDataUseCaseImpl implements TimetableLoadDataUseCase {
  final TimetableRepository timetableRepo;

  const TimetableLoadDataUseCaseImpl(this.timetableRepo);
  @override
  Future<Timetable> call() async {
    return await timetableRepo.getTimetable();
  }
}