import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/mapper/management_mapper.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';

class ManagementRepositoryImpl implements ManagementRepository {
  final ManagementRemoteDataSource _remote;

  const ManagementRepositoryImpl(this._remote);

  @override
  Future<List<ManagedStudent>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  }) =>
      ExceptionHandler.handle(() async {
        final dtos = await _remote.getStudents(
          stream: stream,
          groupId: groupId,
          search: search,
        );
        return dtos.map(ManagementMapper.studentFromDTO).toList();
      });

  @override
  Future<List<Thesis>> getMyTheses() =>
      ExceptionHandler.handle(() async {
        final List<ThesisDTO> dtos = await _remote.getMyTheses();
        return dtos.map<Thesis>(ManagementMapper.thesisFromDTO).toList();
      });

  @override
  Future<Thesis> createThesis(String title) =>
      ExceptionHandler.handle(() async {
        final dto = await _remote.createThesis(title);
        return ManagementMapper.thesisFromDTO(dto);
      });

  @override
  Future<Thesis> updateThesis(String id, {String? title, bool? isFree}) =>
      ExceptionHandler.handle(() async {
        final dto = await _remote.updateThesis(id, title: title, isFree: isFree);
        return ManagementMapper.thesisFromDTO(dto);
      });

  @override
  Future<void> createAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  }) =>
      ExceptionHandler.handle(() => _remote.createAnnouncement(
        title: title,
        content: content,
        publishAt: publishAt,
        expiresAt: expiresAt,
        targetGroupIds: targetGroupIds,
        targetStreamIds: targetStreamIds,
      ));

  @override
  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) =>
      ExceptionHandler.handle(() => _remote.createEvent(
        title: title,
        annotation: annotation,
        startsAt: startsAt,
        endsAt: endsAt,
        roomId: roomId,
      ));
}