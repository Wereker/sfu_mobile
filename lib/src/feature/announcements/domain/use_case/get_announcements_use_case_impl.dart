import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/announcements/domain/entity/announcement.dart';
import 'package:sfu/src/feature/announcements/domain/repository/announcements_repository.dart';
import 'package:sfu/src/feature/announcements/domain/use_case/get_announcements_use_case.dart';

class GetAnnouncementsUseCaseImpl implements GetAnnouncementsUseCase {
  final AnnouncementsRepository _repo;
  const GetAnnouncementsUseCaseImpl(this._repo);

  @override
  Future<List<Announcement>> call() =>
      ExceptionHandler.handle(_repo.getAnnouncements);
}