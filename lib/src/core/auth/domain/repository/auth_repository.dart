abstract class AuthRepository {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String group,
    required String subgroup,
    required String role,
  });
  Future<bool> signInWithGoogle();
  Future<bool> resetPassword(String newPassword);
  Future<bool> logout();
  Future<bool> checkAuthStatus();
}
