import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_in_use_case.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepo;

  const SignInUseCaseImpl({required this.authRepo});

  @override
  Future<bool> call(String login, String password) async {
    return await authRepo.signIn(login, password);
  }
}