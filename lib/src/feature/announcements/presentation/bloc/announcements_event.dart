part of 'announcements_bloc.dart';

@freezed
class AnnouncementsEvent with _$AnnouncementsEvent {
  const factory AnnouncementsEvent.load() = _Load;
}
