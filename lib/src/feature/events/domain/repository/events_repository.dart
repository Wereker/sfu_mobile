import 'package:sfu/src/feature/events/domain/entity/event.dart';

abstract class EventsRepository {
  Future<List<Event>> getEvents();
  Future<void> enrollEvent(String id);
  Future<void> unenrollEvent(String id);
}
