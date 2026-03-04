import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessagesForChat(String chatId);
}