import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case.dart';

class CheckAuthStatusUseCaseImpl implements CheckAuthStatusUseCase {
  final AuthRepository authRepo;

  const CheckAuthStatusUseCaseImpl(this.authRepo);

  @override
  Future<bool> call() async {
    return await authRepo.checkAuthStatus();
  }

}