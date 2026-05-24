import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';
import 'package:sfu/src/feature/announcements/data/mapper/announcement_mapper.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';
import 'package:sfu/src/feature/announcements/domain/repository/announcements_repository.dart';

class AnnouncementsRepositoryImpl implements AnnouncementsRepository {
  final AnnouncementsRemoteDataSource _remote;

  const AnnouncementsRepositoryImpl(this._remote);

  @override
  Future<List<Announcement>> getAnnouncements() =>
      ExceptionHandler.handle(() async {
        final dtos = await _remote.getAnnouncements();
        final announcements = dtos.map(AnnouncementMapper.fromDTO).toList();

        // Закреплённые — в начало
        return [
          ...announcements.where((a) => a.isPinned),
          ...announcements.where((a) => !a.isPinned),
        ];
      });
}