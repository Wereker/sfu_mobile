import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

abstract class ChatWsDataSource {
  /// Подключиться к чату и получить поток входящих сообщений.
  /// Бросает [WsUnauthorizedException] / [WsForbiddenException] при закрытии.
  Stream<MessageDTO> connect(int chatId);

  /// Отправить plain-text сообщение
  void send(String text);

  /// Закрыть соединение
  void disconnect();

  /// true если соединение активно
  bool get isConnected;
}