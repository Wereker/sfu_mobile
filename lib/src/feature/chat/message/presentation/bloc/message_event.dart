part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.connect(int chatId) = _Connect;
  const factory MessageEvent.send(String text) = _Send;
  const factory MessageEvent.disconnect() = _Disconnect;
  // Внутреннее — новое сообщение от WS
  const factory MessageEvent.messageReceived(Message message) = _MessageReceived;
  // Внутреннее — ошибка WS
  const factory MessageEvent.wsError(String error) = _WsError;
}