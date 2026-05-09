import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';

abstract class GetAnnouncementsUseCase {
  Future<List<Announcement>> call();
}