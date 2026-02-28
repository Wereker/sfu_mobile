import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case.dart';

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository authRepo;

  const LogoutUseCaseImpl(this.authRepo);

  @override
  Future<void> call() async {
    await authRepo.logout();
  }
}