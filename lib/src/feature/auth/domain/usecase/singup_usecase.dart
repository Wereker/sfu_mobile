import 'package:sfu/src/core/domain/usecase/use_case.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthRepository authRepo;

  const SignUpUseCase({required this.authRepo});

  @override
  Future<void> call(SignUpParams p) async {
    await authRepo.singUp();
  }
}

class SignUpParams {
  final String login;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  SignUpParams({
    required this.login,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });
}
