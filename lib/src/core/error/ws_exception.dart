import 'package:sfu/src/core/error/app_exception.dart';

/// Ошибки WebSocket-соединения
class WsException extends AppException {
  const WsException(super.message);
}

/// Токен невалиден или просрочен (код 4001)
class WsUnauthorizedException extends WsException {
  const WsUnauthorizedException()
      : super('Сессия истекла. Войдите в аккаунт заново.');
}

/// Пользователь не является участником чата (код 4003)
class WsForbiddenException extends WsException {
  const WsForbiddenException()
      : super('У вас нет доступа к этому чату.');
}

/// Соединение неожиданно разорвано
class WsDisconnectedException extends WsException {
  const WsDisconnectedException()
      : super('Соединение с чатом прервано.');
}

/// Ошибка парсинга входящего сообщения
class WsParseException extends WsException {
  const WsParseException(String details)
      : super('Не удалось обработать сообщение: $details');
}