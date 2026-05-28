import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/connect_to_chat_use_case.dart';

class ConnectToChatUseCaseImpl implements ConnectToChatUseCase {
  final ChatRepository _repo;
  const ConnectToChatUseCaseImpl(this._repo);

  @override
  Stream<Message> call(int chatId) => _repo.connectToChat(chatId);
}