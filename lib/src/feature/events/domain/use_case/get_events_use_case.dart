import 'package:sfu/src/feature/events/domain/entity/event.dart';

abstract class GetEventsUseCase {
  Future<List<Event>> call();
}