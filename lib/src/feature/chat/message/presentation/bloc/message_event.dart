part of 'message_bloc.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.getMessagesForChat(String chatId) = _GetMessagesForChat;
}