abstract class SignUpUseCase {
  Future<bool> call({
    required String login,
    required String password1,
    required String password2,
    required String firstName,
    required String lastName
  });
}