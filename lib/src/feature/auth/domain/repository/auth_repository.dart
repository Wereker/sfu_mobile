abstract class AuthRepository {
  Future<bool> signIn(String login, String password);
  Future<bool> singUp({
    required String login,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<bool> resetPassword(String password);
  Future<bool> logout();
}
