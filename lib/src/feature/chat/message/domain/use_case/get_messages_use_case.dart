import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class GetMessagesUseCase {
  Future<List<Message>> call(int chatId);
}