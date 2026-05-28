import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class ChatRepository {
  Future<List<Chat>> getChats();
  Future<Chat> openDirectChat(int userId);
  Future<List<Message>> getMessages(int chatId);
  Stream<Message> connectToChat(int chatId);
  void sendMessage(String text);
  void disconnectFromChat();
}