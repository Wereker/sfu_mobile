import 'package:sfu/src/feature/auth/data/DTO/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<UserDTO> signIn(String login, String password);
  Future<UserDTO> signUp(
    String login,
    String password,
    String firstName,
    String lastName,
    String phone,
  );
}
