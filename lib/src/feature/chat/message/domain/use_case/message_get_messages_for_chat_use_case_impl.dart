import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/repository/message_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/message_get_messages_for_chat_use_case.dart';

class MessageGetMessagesForChatUseCaseImpl implements MessageGetMessagesForChatUseCase {
  final MessageRepository repo;

  const MessageGetMessagesForChatUseCaseImpl(this.repo);

  @override
  Future<List<Message>> call(String chatId) async {
    return await repo.getMessagesForChat(chatId);
  }

}