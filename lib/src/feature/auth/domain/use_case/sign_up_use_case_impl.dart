import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository authRepo;

  const SignUpUseCaseImpl(this.authRepo);

  @override
  Future<bool> call({
    required String login,
    required String password1,
    required String password2,
    required String firstName,
    required String lastName
  }) async {
    if (password1 != password2) {

    }

    return await authRepo.singUp(
      login: login,
      password: password1,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
