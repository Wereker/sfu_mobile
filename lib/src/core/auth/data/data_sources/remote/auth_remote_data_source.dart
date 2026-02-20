import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';

abstract class AuthRemoteDataSource {
  Future<TokenDTO> signIn(String login, String password);
  Future<TokenDTO> signUp(
    String login,
    String password,
    String name,
    String group,
    String subgroup,
    String role,
  );
  Future<TokenDTO> resetPassword(
    String password,
    String newPassword,
  );
  Future<TokenDTO> refreshToken(String token);
  Future<String> getUserGroup();
  Future<String> getUserRole();
  Future<String> getUserSubgroup();
}
