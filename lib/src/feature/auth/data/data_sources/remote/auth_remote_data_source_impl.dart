import 'package:sfu/src/feature/auth/data/DTO/token_dto.dart';
import 'package:sfu/src/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';

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
    String firstName,
    String lastName,
    String phone,
  ) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
