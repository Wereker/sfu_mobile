import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/domain/use_case/open_direct_chat_use_case.dart';

class OpenDirectChatUseCaseImpl implements OpenDirectChatUseCase {
  final ChatRepository _repo;
  const OpenDirectChatUseCaseImpl(this._repo);

  @override
  Future<Chat> call(int userId) => _repo.openDirectChat(userId);
}