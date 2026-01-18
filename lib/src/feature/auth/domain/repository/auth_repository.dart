import 'package:sfu/src/core/domain/entity/user.dart';


abstract class AuthRepository {
  Future<User> signIn(String login, String password);
  Future<void> singUp();
  Future<void> resetPassword(String password);
  Future<void> logout();
}