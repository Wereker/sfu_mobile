import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';
import 'package:sfu/src/core/error/auth_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository _repo;
  const SignInUseCaseImpl(this._repo);

  @override
  Future<void> call({required String email, required String password}) async {
    final trimmedEmail = email.trim();
    final trimmedPassword = password.trim();

    if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
      throw const InvalidCredentialsException();
    }

    if (!_isValidEmail(trimmedEmail)) {
      throw const InvalidCredentialsException();
    }

    if (trimmedPassword.length < 4) {
      throw const InvalidCredentialsException();
    }

    return ExceptionHandler.handle(
      () => _repo.signIn(trimmedEmail, trimmedPassword),
    );
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\-.]+@[\w\-]+\.[a-z]{2,}$');
    return regex.hasMatch(email);
  }
}
