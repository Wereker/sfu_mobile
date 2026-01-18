import 'package:sfu/src/core/domain/entity/user.dart';
import 'package:sfu/src/core/domain/usecase/use_case.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';


class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepository authRepo;

  const SignInUseCase({required this.authRepo});

  @override
  Future<User> call(SignInParams p) async {
    return await authRepo.signIn(p.login, p.password);
  }
}

class SignInParams {
  final String login;
  final String password;

  const SignInParams(this.login, this.password);
}