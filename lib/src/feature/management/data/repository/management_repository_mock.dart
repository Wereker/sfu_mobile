import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/mapper/management_mapper.dart';
import 'package:sfu/src/feature/management/domain/entity/managed_student.dart';
import 'package:sfu/src/feature/management/domain/entity/thesis.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';

import '../dto/thesis_dto.dart';

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
      stream:  stream,
      groupId: groupId,
      search:  search,
    );
    return dtos.map(ManagementMapper.studentFromDTO).toList();
  }

  @override
  Future<List<Thesis>> getMyTheses() async {
    final List<ThesisDTO> dtos = await _remote.getMyTheses();
    return dtos.map<Thesis>(ManagementMapper.thesisFromDTO).toList();
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
    required String  title,
    required String  body,
    required String  audience,
    bool             isPinned = false,
    String?          stream,
    String?          groupId,
    List<String>     tags = const [],
  }) => _remote.createAnnouncement(
    title: title, body: body, audience: audience,
    isPinned: isPinned, stream: stream, groupId: groupId, tags: tags,
  );

  @override
  Future<void> createEvent({
    required String  title,
    required String  body,
    required String  date,
    required String  time,
    required String  location,
    required int     totalSeats,
    required String  audience,
    String?          stream,
    String?          groupId,
    List<String>     tags = const [],
  }) => _remote.createEvent(
    title: title, body: body, date: date, time: time,
    location: location, totalSeats: totalSeats, audience: audience,
    stream: stream, groupId: groupId, tags: tags,
  );
}