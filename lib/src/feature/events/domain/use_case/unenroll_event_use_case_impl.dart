import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/events/domain/repository/events_repository.dart';
import 'package:sfu/src/feature/events/domain/use_case/unenroll_event_use_case.dart';

class UnenrollEventUseCaseImpl implements UnenrollEventUseCase {
  final EventsRepository _repo;
  const UnenrollEventUseCaseImpl(this._repo);

  @override
  Future<void> call(String eventId) async {
    if (eventId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор события');
    }
    return ExceptionHandler.handle(() => _repo.unenrollEvent(eventId));
  }
}
