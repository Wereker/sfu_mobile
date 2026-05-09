import 'package:sfu/src/core/auth/data/dto/auth_user_data.dart';
import 'package:sfu/src/core/auth/data/dto/token_dto.dart';

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
  Future<void>     resetPassword(String newPassword);
  Future<TokenDTO> refreshToken(String token);
  Future<AuthMetadataDTO> getUserData(String uid);
}
