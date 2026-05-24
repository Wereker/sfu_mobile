import 'package:sfu/src/feature/events/data/dto/event_dto/event_dto.dart';

abstract class EventsRemoteDataSource {
  Future<List<EventDTO>> getEvents();
  Future<void> enrollEvent(String id);
  Future<void> unenrollEvent(String id);
}
