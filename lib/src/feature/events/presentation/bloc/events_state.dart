part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = _EventsInitial;
  const factory EventsState.loading() = _EventsLoading;
  const factory EventsState.success(List<Event> events) = _EventsSuccess;
  const factory EventsState.error(String message) = _EventsError;
}
