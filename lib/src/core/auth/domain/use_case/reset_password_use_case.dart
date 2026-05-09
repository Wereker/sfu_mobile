abstract class ResetPasswordUseCase {
  Future<void> call({
    required String newPassword,
    required String confirmPassword,
  });
}
