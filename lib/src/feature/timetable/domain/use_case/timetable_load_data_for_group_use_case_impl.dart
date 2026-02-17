import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data__for_group_use_case.dart';

class TimetableLoadDataForGroupUseCaseImpl implements TimetableLoadDataForGroupUseCase {
  final TimetableRepository timetableRepo;

  const TimetableLoadDataForGroupUseCaseImpl(this.timetableRepo);
  @override
  Future<Timetable> call() async {
    return await timetableRepo.getTimetableForGroup();
  }
}