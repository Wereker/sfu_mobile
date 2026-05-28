import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/dto/managed_student_dto.dart';
import 'package:sfu/src/feature/management/data/dto/thesis_dto.dart';

class ManagementRemoteDataSourceImpl implements ManagementRemoteDataSource {
  final Dio _authorizedClient;

  const ManagementRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<ManagedStudentDTO>> getStudents({
    String? stream,
    String? groupId,
    String? search,
  }) =>
      ExceptionHandler.handle(() async {
        final response =
        await _authorizedClient.get<List<dynamic>>('/students');
        return (response.data ?? [])
            .map((e) =>
            ManagedStudentDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<List<ThesisDTO>> getMyTheses() =>
      ExceptionHandler.handle(() async {
        final response =
        await _authorizedClient.get<List<dynamic>>('/theses/my');
        return (response.data ?? [])
            .map((e) => ThesisDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<ThesisDTO> createThesis(String title) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>('/theses', data: {'title': title});
        return ThesisDTO.fromJson(response.data!);
      });

  @override
  Future<ThesisDTO> updateThesis(String id,
      {String? title, bool? isFree}) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient.patch<Map<String, dynamic>>(
          '/theses/$id',
          data: {
            if (title != null) 'title': title,
            if (isFree != null) 'is_free': isFree,
          },
        );
        return ThesisDTO.fromJson(response.data!);
      });

  @override
  Future<void> createEvent({
    required String title,
    required String annotation,
    required String startsAt,
    required String endsAt,
    required int roomId,
  }) =>
      ExceptionHandler.handle(() async {
        await _authorizedClient.post<void>('/events', data: {
          'title': title,
          'annotation': annotation,
          'starts_at': startsAt,
          'ends_at': endsAt,
          'room_id': roomId,
        });
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
      ExceptionHandler.handle(() async {
        await _authorizedClient.post<void>('/announcements', data: {
          'title': title,
          'content': content,
          'publish_at': publishAt,
          'expires_at': expiresAt,
          'target_group_ids': targetGroupIds,
          'target_stream_ids': targetStreamIds,
        });
      });
}