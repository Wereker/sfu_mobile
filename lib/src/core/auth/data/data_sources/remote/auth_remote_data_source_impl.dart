import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<TokenDTO> signIn(String login, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<TokenDTO> signUp(
    String login,
    String password,
    String name,
    String group,
    String subgroup,
    String role,
  ) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<TokenDTO> resetPassword(
    String newPassword,
  ) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<TokenDTO> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<String> getUserGroup() {
    // TODO: implement getUserGroup
    throw UnimplementedError();
  }

  @override
  Future<String> getUserRole() {
    // TODO: implement getUserRole
    throw UnimplementedError();
  }

  @override
  Future<String> getUserSubgroup() {
    // TODO: implement getUserSubgroup
    throw UnimplementedError();
  }
}
