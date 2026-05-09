import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthRepository _repo;
  const ResetPasswordUseCaseImpl(this._repo);

  @override
  Future<void> call({
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword.length < 8) {
      throw const ValidationException('Пароль должен быть не менее 8 символов');
    }

    if (newPassword != confirmPassword) {
      throw const ValidationException('Пароли не совпадают');
    }

    return ExceptionHandler.handle(() => _repo.resetPassword(newPassword));
  }
}
