abstract class PublishAnnouncementUseCase {
  Future<void> call({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  });
}