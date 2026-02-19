import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_target_use_case.dart';

class TimetableLoadDataForTargetUseCaseImpl
    implements TimetableLoadDataForTargetUseCase {
  final TimetableRepository _repo;

  const TimetableLoadDataForTargetUseCaseImpl(TimetableRepository repo)
    : _repo = repo;

  @override
  Future<Timetable> call(String target) async {
    return await _repo.getTimetableForTarget(target);
  }
}
