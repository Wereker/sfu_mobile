import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class ConnectToChatUseCase {
  Stream<Message> call(int chatId);
}