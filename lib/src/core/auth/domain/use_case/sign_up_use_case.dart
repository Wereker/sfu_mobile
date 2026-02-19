abstract class SignUpUseCase {
  Future<bool> call({
    required String login,
    required String password1,
    required String password2,
    required String name,
    required String role,
    required String group,
  });
}
