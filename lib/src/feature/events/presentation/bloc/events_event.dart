part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.load()                = _Load;
  const factory EventsEvent.enroll(String eventId)   = _Enroll;
  const factory EventsEvent.unenroll(String eventId) = _Unenroll;
}