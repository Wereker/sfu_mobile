import 'package:sfu/src/core/auth/data/DTO/token_dto.dart';

abstract class AuthRemoteDataSource {
  Future<TokenDTO> signIn(String email, String password);
  Future<TokenDTO> signUp(
    String email,
    String password,
    String name,
    String group,
    String subgroup,
    String role,
  );
  Future<TokenDTO> resetPassword(
    String newPassword,
  );
  Future<TokenDTO> refreshToken(String token);
  Future<String> getUserName();
  Future<String> getUserGroup();
  Future<String> getUserRole();
  Future<String> getUserSubgroup();
}
