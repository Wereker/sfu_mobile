import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/check_auth_status_use_case.dart';

class CheckAuthStatusUseCaseImpl implements CheckAuthStatusUseCase {
  final AuthRepository authRepo;

  const CheckAuthStatusUseCaseImpl(this.authRepo);

  @override
  Future<bool> call() async {
    return await authRepo.checkAuthStatus();
  }

}