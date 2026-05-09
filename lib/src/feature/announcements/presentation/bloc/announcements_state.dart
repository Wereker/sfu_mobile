part of 'announcements_bloc.dart';

@freezed
class AnnouncementsState with _$AnnouncementsState {
  const factory AnnouncementsState.initial() = _AnnouncementsInitial;
  const factory AnnouncementsState.loading() = _AnnouncementsLoading;
  const factory AnnouncementsState.success(List<Announcement> announcements) = _AnnouncementsSuccess;
  const factory AnnouncementsState.error(String message) = _AnnouncementsError;
}