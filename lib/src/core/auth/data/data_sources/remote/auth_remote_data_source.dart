import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';

abstract class AuthRemoteDataSource {
  Future<TokenDTO> signIn(String login, String password);
  Future<TokenDTO> signUp(
    String login,
    String password,
    String firstName,
    String lastName,
    String phone,
  );
}
