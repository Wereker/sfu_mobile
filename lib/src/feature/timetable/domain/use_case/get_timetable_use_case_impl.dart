import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case.dart';

class GetTimetableUseCaseImpl implements GetTimetableUseCase {
  final TimetableRepository _repo;
  const GetTimetableUseCaseImpl(this._repo);

  @override
  Future<Timetable> call({
    required int targetId,
    required TimetableTargetType type,
  }) =>
      ExceptionHandler.handle(
            () => _repo.getTimetable(targetId: targetId, type: type),
      );
}
