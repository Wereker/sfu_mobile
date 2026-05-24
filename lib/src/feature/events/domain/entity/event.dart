import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    // — с сервера —
    required String id,
    required String title,
    required String annotation,
    required DateTime startsAt,
    required DateTime endsAt,
    required String roomNumber,
    required String roomAddress,
    required int roomCapacity,
    required String creatorId,
    String? imageUrl,

    // — синтетика до появления на сервере —
    @Default('') String body,
    @Default('') String organizer,
    @Default(0)  int takenSeats,
    @Default(false) bool isEnrolled,
    @Default([]) List<String> tags,
  }) = _Event;
}