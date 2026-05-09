import 'package:sfu/src/feature/announcements/data/dto/announcement_dto.dart';

abstract class AnnouncementsRemoteDataSource {
  Future<List<AnnouncementDTO>> getAnnouncements();
}