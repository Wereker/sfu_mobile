import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _authorizedClient;
  final AuthLocalDataSource _localDataSource;

  const ProfileRemoteDataSourceImpl({
    required Dio authorizedClient,
    required AuthLocalDataSource localDataSource,
  })  : _authorizedClient = authorizedClient,
        _localDataSource = localDataSource;

  @override
  Future<UserDTO> getProfile() => ExceptionHandler.handle(() async {
    final response = await _authorizedClient
        .get<Map<String, dynamic>>('/users/me');
    return UserDTO.fromJson(response.data!);
  });

  @override
  Future<String> getAvatarUrl(int userId) async {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    final token = await _localDataSource.getAccessToken();
    return '$baseUrl/users/$userId/avatar?token=${token ?? ''}';
  }

  @override
  Future<void> uploadAvatar(String filePath) =>
      ExceptionHandler.handle(() async {
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(
            filePath,
            filename: filePath.split('/').last,
          ),
        });
        await _authorizedClient.patch<void>(
          '/users/me/avatar',
          data: formData,
        );
      });
}