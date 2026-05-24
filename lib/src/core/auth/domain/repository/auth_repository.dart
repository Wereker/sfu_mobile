abstract class AuthRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password,
  });

  Future<void> resetPassword(String newPassword);
  Future<void> logout();
  Future<void> checkAuthStatus();
}