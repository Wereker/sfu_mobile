import 'package:sfu/src/core/domain/usecase/no_params_use_case.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';

class LogoutUseCase implements NoParamsUseCase<void> {
  final AuthRepository authRepo;

  const LogoutUseCase({required this.authRepo});

  @override
  Future<void> call() async {
    await authRepo.logout();
  }
}