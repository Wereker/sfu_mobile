// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@freezed
abstract class EventDTO with _$EventDTO {
  const factory EventDTO({
    required String id,
    required String date,
    required String time,
    required String title,
    @Default('') String preview,
    required String body,
    required String location,
    @Default('') String organizer,
    @JsonKey(name: 'organizer_id') @Default('') String organizerId,
    @JsonKey(name: 'total_seats') @Default(0) int totalSeats,
    @JsonKey(name: 'taken_seats') @Default(0) int takenSeats,
    @JsonKey(name: 'is_enrolled') @Default(false) bool isEnrolled,
    @Default([]) List<String> tags,
  }) = _EventDTO;

  factory EventDTO.fromJson(Map<String, dynamic> json) =>
      _$EventDTOFromJson(json);
}
