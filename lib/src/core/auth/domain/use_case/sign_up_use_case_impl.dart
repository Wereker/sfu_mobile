import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';
import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository _repo;
  const SignUpUseCaseImpl(this._repo);

  @override
  Future<void> call({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password1,
    required String password2,
    required int groupId,
  }) async {
    final trimmedEmail    = email.trim();
    final trimmedName     = name.trim();
    final trimmedSurname  = surname.trim();

    if (trimmedName.isEmpty) {
      throw const ValidationException('Введите имя');
    }
    if (trimmedSurname.isEmpty) {
      throw const ValidationException('Введите фамилию');
    }
    if (trimmedEmail.isEmpty) {
      throw const ValidationException('Введите email');
    }
    if (!_isValidEmail(trimmedEmail)) {
      throw const ValidationException('Неверный формат email');
    }
    if (password1.length < 8) {
      throw const ValidationException('Пароль должен быть не менее 8 символов');
    }
    if (password1 != password2) {
      throw const ValidationException('Пароли не совпадают');
    }
    if (groupId <= 0) {
      throw const ValidationException('Выберите учебную группу');
    }

    return ExceptionHandler.handle(
          () => _repo.signUp(
        name: trimmedName,
        surname: trimmedSurname,
        patronymic: patronymic.trim(),
        email: trimmedEmail,
        password: password1,
        groupId: groupId,
      ),
    );
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\-.]+@[\w\-]+\.[a-z]{2,}$');
    return regex.hasMatch(email);
  }
}