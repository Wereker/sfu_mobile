abstract class PublishEventUseCase {
  Future<void> call({
    required String title,
    required String body,
    required String date,       // 'YYYY-MM-DD'
    required String time,       // 'HH:mm'
    required String location,
    required int    totalSeats,
    required String audience,
    String?          stream,
    String?          groupId,
    List<String>     tags,
  });
}