abstract class PublishAnnouncementUseCase {
  Future<void> call({
    required String title,
    required String body,
    required String audience,
    bool isPinned,
    String? stream,
    String? groupId,
    List<String> tags,
  });
}
