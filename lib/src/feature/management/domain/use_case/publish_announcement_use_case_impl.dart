import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_announcement_use_case.dart';

class PublishAnnouncementUseCaseImpl implements PublishAnnouncementUseCase {
  final ManagementRepository _repo;
  const PublishAnnouncementUseCaseImpl(this._repo);

  @override
  Future<void> call({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  }) =>
      _repo.createAnnouncement(
        title: title,
        content: content,
        publishAt: publishAt,
        expiresAt: expiresAt,
        targetGroupIds: targetGroupIds,
        targetStreamIds: targetStreamIds,
      );
}