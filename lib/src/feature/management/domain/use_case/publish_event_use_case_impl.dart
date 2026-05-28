import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_event_use_case.dart';

class PublishEventUseCaseImpl implements PublishEventUseCase {
  final ManagementRepository _repo;
  const PublishEventUseCaseImpl(this._repo);

  @override
  Future<void> call({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) =>
      _repo.createEvent(
        title: title,
        annotation: annotation,
        startsAt: startsAt,
        endsAt: endsAt,
        roomId: roomId,
      );
}