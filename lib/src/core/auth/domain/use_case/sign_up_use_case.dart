abstract class SignUpUseCase {
  Future<void> call({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password1,
    required String password2,
  });
}