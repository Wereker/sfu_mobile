import 'package:sfu/src/core/error/app_exception.dart';

// Неверный логин или пароль
class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException()
      : super('Неверный логин или пароль');
}

// Токен истёк — нужна повторная авторизация
class UnauthorizedException extends AppException {
  const UnauthorizedException()
      : super('Сессия истекла, войдите снова');
}

// Нет прав доступа (403)
class ForbiddenException extends AppException {
  const ForbiddenException()
      : super('Нет доступа к этому ресурсу');
}