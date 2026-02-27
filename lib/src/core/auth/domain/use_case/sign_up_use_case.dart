abstract class SignUpUseCase {
  Future<bool> call({
    required String email,
    required String password1,
    required String password2,
    required String name,
    required String role,
    required String group,
  });
}
