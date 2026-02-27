abstract class SignInUseCase {
  Future<bool> call(String email, String password);
}