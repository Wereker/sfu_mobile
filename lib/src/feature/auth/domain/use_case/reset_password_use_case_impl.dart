import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/reset_password_use_case.dart';

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository authRepo;

  const ResetPasswordUseCaseImpl({required this.authRepo});

  @override
  Future<bool> call(String password) async {
    return await authRepo.resetPassword(password);
  }

}