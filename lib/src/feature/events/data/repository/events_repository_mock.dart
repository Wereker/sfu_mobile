import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/events/data/dto/event_dto.dart';
import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source.dart';
import 'package:sfu/src/feature/events/data/mapper/event_mapper.dart';
import 'package:sfu/src/feature/events/domain/entity/event.dart';
import 'package:sfu/src/feature/events/domain/repository/events_repository.dart';

class EventsRepositoryMock implements EventsRepository {
  final EventsRemoteDataSource _remote;

  const EventsRepositoryMock(this._remote);

  @override
  Future<List<Event>> getEvents() async {
    return ExceptionHandler.handle(() async {
      final List<EventDTO> dtos = await _remote.getEvents();
      return dtos.map<Event>(EventMapper.fromDTO).toList();
    });
  }

  @override
  Future<void> enrollEvent(String id) => _remote.enrollEvent(id);

  @override
  Future<void> unenrollEvent(String id) => _remote.unenrollEvent(id);
}
