import 'package:sfu/src/core/data/DTO/user_dto.dart';
import 'package:sfu/src/feature/auth/data/data_sources/local/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheToken(String token) {
    // TODO: implement cacheToken
    throw UnimplementedError();
  }

  @override
  Future<void> cacheUser(UserDTO user) {
    // TODO: implement cacheUser
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<String> getCachedToken() {
    // TODO: implement getCachedToken
    throw UnimplementedError();
  }

  @override
  Future<UserDTO> getCachedUser() {
    // TODO: implement getCachedUser
    throw UnimplementedError();
  }

}