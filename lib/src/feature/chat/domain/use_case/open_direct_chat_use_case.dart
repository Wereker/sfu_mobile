import 'package:sfu/src/feature/chat/domain/entity/chat.dart';

abstract class OpenDirectChatUseCase {
  Future<Chat> call(int userId);
}