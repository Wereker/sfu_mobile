import 'package:sfu/src/feature/events/data/dto/event_dto.dart';
import 'package:sfu/src/feature/events/domain/entity/event/event.dart';

abstract class EventMapper {
  static Event fromDTO(EventDTO dto) => Event(
    id:          dto.id,
    date:        DateTime.parse(dto.date),
    time:        dto.time,
    title:       dto.title,
    preview:     dto.preview,
    body:        dto.body,
    location:    dto.location,
    organizer:   dto.organizer,
    organizerId: dto.organizerId,
    totalSeats:  dto.totalSeats,
    takenSeats:  dto.takenSeats,
    isEnrolled:  dto.isEnrolled,
    tags:        dto.tags,
  );
}