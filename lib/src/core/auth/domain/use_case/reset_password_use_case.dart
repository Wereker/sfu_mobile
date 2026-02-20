abstract class ResetPasswordUseCase {
  Future<bool> call(String password, String newPassword);
}
