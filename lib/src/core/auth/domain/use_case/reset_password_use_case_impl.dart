import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository authRepo;

  const ResetPasswordUseCaseImpl(this.authRepo);

  @override
  Future<bool> call(String newPassword) async {
    return await authRepo.resetPassword(newPassword);
  }

}