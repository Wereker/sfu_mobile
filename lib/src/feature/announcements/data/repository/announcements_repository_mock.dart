import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';
import 'package:sfu/src/feature/announcements/data/mapper/announcement_mapper.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';
import 'package:sfu/src/feature/announcements/domain/repository/announcements_repository.dart';

class AnnouncementsRepositoryMock implements AnnouncementsRepository {
  final AnnouncementsRemoteDataSource _remote;

  const AnnouncementsRepositoryMock(this._remote);

  @override
  Future<List<Announcement>> getAnnouncements() async {
    return ExceptionHandler.handle(() async {
      final dtos = await _remote.getAnnouncements();
      final items = dtos.map(AnnouncementMapper.fromDTO).toList();
      // Закреплённые — первыми
      items.sort((a, b) {
        if (a.isPinned && !b.isPinned) return -1;
        if (!a.isPinned && b.isPinned) return 1;
        return b.date.compareTo(a.date);
      });
      return items;
    });
  }
}