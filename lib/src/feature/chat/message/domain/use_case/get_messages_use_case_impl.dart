import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case.dart';

class GetMessagesUseCaseImpl implements GetMessagesUseCase {
  final ChatRepository _repo;
  const GetMessagesUseCaseImpl(this._repo);

  @override
  Future<List<Message>> call(int chatId) => _repo.getMessages(chatId);
}