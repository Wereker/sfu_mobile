import 'package:sfu/src/core/auth/data/DTO/auth_user_data.dart';
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
  Future<AuthMetadata> getUserData(String uid);
}
