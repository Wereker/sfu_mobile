import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/events/data/dto/room_dto.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@freezed
abstract class EventDTO with _$EventDTO {
  const factory EventDTO({
    @JsonKey(fromJson: _intToString) required String id,
    required String title,
    required String annotation,
    @JsonKey(name: 'starts_at') required String startsAt,
    @JsonKey(name: 'ends_at') required String endsAt,
    required RoomDTO room,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'creator_id', fromJson: _intToString) required String creatorId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _EventDTO;

  factory EventDTO.fromJson(Map<String, dynamic> json) =>
      _$EventDTOFromJson(json);

  /// Маппинг из EventRead (API /events).
  /// Обрабатывает nullable поля annotation и room из реального API.
  static EventDTO fromApiJson(Map<String, dynamic> json) {
    final roomJson = json['room'] as Map<String, dynamic>?;

    return EventDTO(
      id: (json['id'] as int).toString(),
      title: json['title'] as String,
      annotation: json['annotation'] as String? ?? '',
      startsAt: json['starts_at'] as String,
      endsAt: json['ends_at'] as String,
      room: roomJson != null
          ? RoomDTO.fromJson(roomJson)
          : const RoomDTO(id: '', number: '—', address: '', capacity: 0),
      imageUrl: json['image_url'] as String?,
      creatorId: (json['creator_id'] as int).toString(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}

String _intToString(dynamic v) => v.toString();