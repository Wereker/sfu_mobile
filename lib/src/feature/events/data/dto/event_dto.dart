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
}

String _intToString(dynamic v) => v.toString();