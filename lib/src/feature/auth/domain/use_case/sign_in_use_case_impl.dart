import 'package:sfu/src/feature/auth/domain/exception/invalid_credentials_error.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_in_use_case.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepo;

  const SignInUseCaseImpl(this.authRepo);

  @override
  Future<bool> call(String login, String password) async {
    if (login == "" || password == "") {
      throw InvalidCredentialsError();
    }
    return await authRepo.signIn(login, password);
  }
}