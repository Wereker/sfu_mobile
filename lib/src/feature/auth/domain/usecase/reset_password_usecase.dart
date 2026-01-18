import 'package:sfu/src/core/domain/usecase/use_case.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<void, String> {
  final AuthRepository authRepo;

  const ResetPasswordUseCase({required this.authRepo});

  @override
  Future<void> call(String password) async {
    await authRepo.resetPassword(password);
  }

}