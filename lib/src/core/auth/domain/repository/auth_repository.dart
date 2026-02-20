abstract class AuthRepository {
  Future<bool> signIn(String login, String password);
  Future<bool> signUp({
    required String login,
    required String password,
    required String name,
    required String group,
    required String subgroup,
    required String role,
  });
  Future<bool> resetPassword(String password, String newPassword);
  Future<bool> logout();
  Future<bool> checkAuthStatus();
}
