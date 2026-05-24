import 'package:sfu/src/feature/events/data/dto/event_dto.dart';
import 'package:sfu/src/feature/events/domain/entity/event.dart';

abstract class EventMapper {
  static Event fromDTO(EventDTO dto) => Event(
    // — серверные поля —
    id: dto.id,
    title: dto.title,
    annotation: dto.annotation,
    startsAt: DateTime.parse(dto.startsAt),
    endsAt: DateTime.parse(dto.endsAt),
    roomNumber: dto.room.number,
    roomAddress: dto.room.address,
    roomCapacity: dto.room.capacity,
    creatorId: dto.creatorId,
    imageUrl: dto.imageUrl,

    // — синтетика —
    body: dto.annotation,
    organizer: _mockOrganizer(dto.creatorId),
    takenSeats: _mockTakenSeats(dto.id),
    isEnrolled: false,
    tags: _mockTags(dto.title),
  );

  static String _mockOrganizer(String creatorId) {
    const map = {'1': 'Кафедра ИКИТ'};
    return map[creatorId] ?? 'Кафедра ИКИТ';
  }

  static int _mockTakenSeats(String id) {
    const map = {
      '3': 120, '4': 70, '5': 89,
      '6': 12,  '7': 60, '8': 8,
    };
    return map[id] ?? 0;
  }

  static List<String> _mockTags(String title) {
    final t = title.toLowerCase();
    if (t.contains('хакатон'))          return ['хакатон', 'разработка', 'IT'];
    if (t.contains('семинар'))          return ['наука', 'исследования'];
    if (t.contains('защит'))            return ['учёба', 'ВКР'];
    if (t.contains('открытых дверей'))  return ['абитуриентам'];
    if (t.contains('мастер'))           return ['карьера', 'IT'];
    if (t.contains('спорт') || t.contains('теннис')) return ['спорт'];
    return [];
  }
}