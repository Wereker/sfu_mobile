import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/mapper/management_mapper.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';

class ManagementRepositoryMock implements ManagementRepository {
  final ManagementRemoteDataSource _remote;
  const ManagementRepositoryMock(this._remote);

  @override
  Future<List<ManagedStudent>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  }) async {
    final dtos = await _remote.getStudents(
      stream: stream,
      groupId: groupId,
      search: search,
    );
    return dtos.map(ManagementMapper.studentFromDTO).toList();
  }

  @override
  Future<List<Thesis>> getMyTheses() async {
    final dtos = await _remote.getMyTheses();
    return dtos.map(ManagementMapper.thesisFromDTO).toList();
  }

  @override
  Future<Thesis> createThesis(String title) async {
    final dto = await _remote.createThesis(title);
    return ManagementMapper.thesisFromDTO(dto);
  }

  @override
  Future<Thesis> updateThesis(String id, {String? title, bool? isFree}) async {
    final dto = await _remote.updateThesis(id, title: title, isFree: isFree);
    return ManagementMapper.thesisFromDTO(dto);
  }

  @override
  Future<void> createAnnouncement({
    required String title,
    required String content,
    required String publishAt,
    required String expiresAt,
    required List<int> targetGroupIds,
    required List<int> targetStreamIds,
  }) =>
      _remote.createAnnouncement(
        title: title,
        content: content,
        publishAt: publishAt,
        expiresAt: expiresAt,
        targetGroupIds: targetGroupIds,
        targetStreamIds: targetStreamIds,
      );

  @override
  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) =>
      _remote.createEvent(
        title: title,
        annotation: annotation,
        startsAt: startsAt,
        endsAt: endsAt,
        roomId: roomId,
      );
}