import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/logout_use_case.dart';

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthRepository authRepo;

  const LogoutUseCaseImpl({required this.authRepo});

  @override
  Future<bool> call() async {
    return await authRepo.logout();
  }
}