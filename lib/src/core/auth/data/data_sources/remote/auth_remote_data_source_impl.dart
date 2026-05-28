import 'package:dio/dio.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/data/dto/group_dto.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _publicClient;
  final Dio _authorizedClient;

  const AuthRemoteDataSourceImpl({
    required Dio publicClient,
    required Dio authorizedClient,
  })  : _publicClient = publicClient,
        _authorizedClient = authorizedClient;

  @override
  Future<TokenDTO> signIn(String email, String password) =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.post<Map<String, dynamic>>(
          '/auth/login',
          data: FormData.fromMap({
            'grant_type': 'password',
            'username': email,
            'password': password,
            'scope': '',
            'client_id': '',
            'client_secret': '',
          }),
          options: Options(contentType: 'application/x-www-form-urlencoded'),
        );
        return _parseToken(response);
      });

  @override
  Future<void> signUp({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password,
    required int groupId,
  }) =>
      ExceptionHandler.handle(() async {
        await _publicClient.post<Map<String, dynamic>>(
          '/auth/register',
          data: {
            'name': name,
            'surname': surname,
            if (patronymic.isNotEmpty) 'patronymic': patronymic,
            'email': email,
            'password': password,
            'group_id': groupId,
          },
        );
      });

  @override
  Future<List<GroupDTO>> getGroups() =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.get<List<dynamic>>('/groups');
        return (response.data ?? [])
            .map((e) => GroupDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<void> resetPassword(String newPassword) =>
      ExceptionHandler.handle(() async {
        await _authorizedClient.post<void>(
          '/auth/reset-password',
          data: {'password': newPassword},
        );
      });

  @override
  Future<TokenDTO> refreshToken(String token) =>
      ExceptionHandler.handle(() async {
        final response = await _publicClient.post<Map<String, dynamic>>(
          '/auth/refresh',
          data: {'refresh_token': token},
        );
        return _parseToken(response);
      });

  TokenDTO _parseToken(Response<Map<String, dynamic>> response) {
    final data = response.data;
    if (data == null) {
      throw const ParseException(details: '_parseToken: response body is null');
    }
    return TokenDTO.fromJson(data);
  }
}