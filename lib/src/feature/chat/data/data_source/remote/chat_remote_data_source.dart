import 'package:sfu/src/feature/chat/data/dto/chat_dto/chat_dto.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatDTO>> loadChatForUser();
}