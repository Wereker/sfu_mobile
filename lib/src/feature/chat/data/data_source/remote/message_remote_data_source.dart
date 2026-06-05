import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

abstract class MessageRemoteDataSource {
  Future<List<MessageDTO>> getMessagesForChat(String chatId);
}