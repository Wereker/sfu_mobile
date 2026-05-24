import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:sfu/src/feature/profile/data/dto/user_dto.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _authorizedClient;

  const ProfileRemoteDataSourceImpl({required Dio authorizedClient})
    : _authorizedClient = authorizedClient;

  @override
  Future<UserDTO> getProfile() => ExceptionHandler.handle(() async {
    final response = await _authorizedClient.get<Map<String, dynamic>>(
      '/auth/me',
    );

    return UserDTO.fromJson(response.data!);
  });
}
