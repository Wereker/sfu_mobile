import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository authRepo;

  const SignUpUseCaseImpl(this.authRepo);

  @override
  Future<bool> call({
    required String login,
    required String password,
    required String firstName,
    required String lastName
  }) async {
    return await authRepo.singUp(
      login: login,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
