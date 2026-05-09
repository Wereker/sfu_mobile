import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepo;

  const SignInUseCaseImpl(this.authRepo);

  @override
  Future<void> call(String email, String password) async {
    await authRepo.signIn(email, password);
  }
}