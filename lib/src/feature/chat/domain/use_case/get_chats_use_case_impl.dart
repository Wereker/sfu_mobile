import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/domain/use_case/get_chats_use_case.dart';

class GetChatsUseCaseImpl implements GetChatsUseCase {
  final ChatRepository _repo;
  const GetChatsUseCaseImpl(this._repo);

  @override
  Future<List<Chat>> call() => _repo.getChats();
}