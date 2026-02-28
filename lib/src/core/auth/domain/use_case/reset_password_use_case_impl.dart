import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository authRepo;

  const ResetPasswordUseCaseImpl(this.authRepo);

  @override
  Future<void> call(String newPassword) async {
    await authRepo.resetPassword(newPassword);
  }

}