import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    required String id,
    required DateTime date,
    required String time,
    required String title,
    required String preview,
    required String body,
    required String location,
    required String organizer,
    required String organizerId,
    required int totalSeats,
    required int takenSeats,
    required bool isEnrolled,
    required List<String> tags,
  }) = _Event;

  // bool get isFull => takenSeats >= totalSeats;
  // int  get freeSeats => totalSeats - takenSeats;
}
