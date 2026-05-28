import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

abstract class ChatRemoteDataSource {
  /// GET /api/v1/chats — список своих чатов
  Future<List<ChatDTO>> getChats();

  /// POST /api/v1/chats/direct/{user_id} — открыть/получить личку
  Future<ChatDTO> openDirectChat(int userId);

  /// GET /api/v1/chats/{chat_id}/messages — история сообщений
  Future<List<MessageDTO>> getMessages(int chatId);
}