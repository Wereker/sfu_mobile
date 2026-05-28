part of 'publish_bloc.dart';

@freezed
abstract class PublishEvent with _$PublishEvent {
  const factory PublishEvent.publishAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  }) = _PublishAnnouncement;

  const factory PublishEvent.publishEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) = _PublishEvent;
}