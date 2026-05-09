import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/events/domain/entity/event.dart';
import 'package:sfu/src/feature/events/domain/repository/events_repository.dart';
import 'package:sfu/src/feature/events/domain/use_case/get_events_use_case.dart';

class GetEventsUseCaseImpl implements GetEventsUseCase {
  final EventsRepository _repo;
  const GetEventsUseCaseImpl(this._repo);

  @override
  Future<List<Event>> call() =>
      ExceptionHandler.handle(_repo.getEvents);
}