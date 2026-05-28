abstract class PublishEventUseCase {
  Future<void> call({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  });
}