import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/events/domain/repository/events_repository.dart';
import 'package:sfu/src/feature/events/domain/use_case/enroll_event_use_case.dart';

class EnrollEventUseCaseImpl implements EnrollEventUseCase {
  final EventsRepository _repo;
  const EnrollEventUseCaseImpl(this._repo);

  @override
  Future<void> call(String eventId) async {
    if (eventId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор события');
    }
    return ExceptionHandler.handle(() => _repo.enrollEvent(eventId));
  }
}