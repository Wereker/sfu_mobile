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
        final queryParams = <String, dynamic>{
          'role': 'student',
          if (groupId != null && groupId.isNotEmpty) 'group_id': groupId,
          if (search != null && search.isNotEmpty) 'search': search,
        };
        final response = await _authorizedClient.get<List<dynamic>>(
          '/users',
          queryParameters: queryParams,
        );
        return (response.data ?? [])
            .map((e) => ManagedStudentDTO.fromApiJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<List<ThesisDTO>> getMyTheses() =>
      ExceptionHandler.handle(() async {
        final response =
            await _authorizedClient.get<List<dynamic>>('/vkr/my-topics');
        return (response.data ?? [])
            .map((e) => ThesisDTO.fromApiJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<ThesisDTO> createThesis(String title) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>('/vkr/topics', data: {'title': title});
        return ThesisDTO.fromApiJson(response.data!);
      });

  @override
  Future<ThesisDTO> updateThesis(String id,
          {String? title, bool? isFree}) =>
      ExceptionHandler.handle(() async {
        // API не предоставляет PATCH для тем ВКР — возвращаем текущее состояние
        final response = await _authorizedClient
            .get<Map<String, dynamic>>('/vkr/topics/$id');
        return ThesisDTO.fromApiJson(response.data!);
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
