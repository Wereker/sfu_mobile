import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class MessageGetMessagesForChatUseCase {
  Future<List<Message>> call(String chatId);
}