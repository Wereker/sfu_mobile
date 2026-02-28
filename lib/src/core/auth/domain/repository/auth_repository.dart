abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String group,
    required String subgroup,
    required String role,
  });
  Future<void> signInWithGoogle();
  Future<void> resetPassword(String newPassword);
  Future<void> logout();
  Future<void> checkAuthStatus();
}
