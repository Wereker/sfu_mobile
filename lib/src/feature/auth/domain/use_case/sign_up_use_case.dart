abstract class SignUpUseCase {
  Future<bool> call({
    required String login,
    required String password,
    required String firstName,
    required String lastName
  });
}