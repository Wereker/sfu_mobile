import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/timetable/domain/entity/timetable/timetable.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case.dart';

class GetTimetableUseCaseImpl implements GetTimetableUseCase {
  final TimetableRepository _repo;
  const GetTimetableUseCaseImpl(this._repo);

  @override
  Future<Timetable> call({String? target}) => ExceptionHandler.handle(
        () => target != null
        ? _repo.getTimetableForTarget(target)
        : _repo.getTimetable(),
  );
}