import 'package:sfu/src/core/auth/domain/exception/invalid_credentials_error.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepo;

  const SignInUseCaseImpl(this.authRepo);

  @override
  Future<bool> call(String login, String password) async {
    if (login.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsError();
    }
    return await authRepo.signIn(login, password);
  }
}