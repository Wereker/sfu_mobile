part of 'publish_bloc.dart';

@freezed
abstract class PublishEvent with _$PublishEvent {
  const factory PublishEvent.publishAnnouncement({
    required String title,
    required String body,
    required String audience,
    @Default(false) bool isPinned,
    String? stream,
    String? groupId,
    @Default([]) List<String> tags,
  }) = _PublishAnnouncement;

  const factory PublishEvent.publishEvent({
    required String title,
    required String body,
    required String date,
    required String time,
    required String location,
    required int totalSeats,
    required String audience,
    String? stream,
    String? groupId,
    @Default([]) List<String> tags,
  }) = _PublishEvent;
}
