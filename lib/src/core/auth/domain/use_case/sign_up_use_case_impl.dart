import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository _repo;
  const SignUpUseCaseImpl(this._repo);

  @override
  Future<void> call({
    required String email,
    required String password1,
    required String password2,
    required String name,
    required String role,
    required String group,
  }) async {
    final trimmedEmail = email.trim();
    final trimmedName  = name.trim();

    if (trimmedEmail.isEmpty) {
      throw const ValidationException('Введите email');
    }

    if (!_isValidEmail(trimmedEmail)) {
      throw const ValidationException('Неверный формат email');
    }

    if (trimmedName.isEmpty) {
      throw const ValidationException('Введите имя');
    }

    if (password1.length < 8) {
      throw const ValidationException('Пароль должен быть не менее 8 символов');
    }

    if (password1 != password2) {
      throw const ValidationException('Пароли не совпадают');
    }

    if (role == 'student' && group.trim().isEmpty) {
      throw const ValidationException('Выберите группу');
    }

    // Разбираем 'БИ22-01 (1 подгруппа)' → group + subgroup
    String shortGroup = group;
    String subgroup   = '';
    if (group.contains('(')) {
      final parts = group.split('(');
      shortGroup  = parts[0].trim();
      subgroup    = parts[1].replaceAll(')', '').trim();
    }

    return ExceptionHandler.handle(
          () => _repo.signUp(
        email:    trimmedEmail,
        password: password1,
        name:     trimmedName,
        group:    shortGroup,
        subgroup: subgroup,
        role:     role,
      ),
    );
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\-.]+@[\w\-]+\.[a-z]{2,}$');
    return regex.hasMatch(email);
  }
}
