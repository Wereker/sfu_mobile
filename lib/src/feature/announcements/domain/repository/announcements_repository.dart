import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';

abstract class AnnouncementsRepository {
  Future<List<Announcement>> getAnnouncements();
}