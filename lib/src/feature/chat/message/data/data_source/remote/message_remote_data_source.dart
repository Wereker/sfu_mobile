import 'package:sfu/src/feature/chat/message/data/DTO/message_dto.dart';

abstract class MessageRemoteDataSource {
  Future<List<MessageDTO>> getMessagesForChar(String chatId);
}