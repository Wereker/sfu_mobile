part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.loadData() = _MessageLoadData;

  const factory MessageEvent.getMessagesForChat(String chatId) = _MessageGetMessagesForChat;
}