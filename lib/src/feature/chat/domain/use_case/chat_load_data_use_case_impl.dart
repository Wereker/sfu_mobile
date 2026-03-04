import 'package:sfu/src/feature/chat/domain/entity/chat/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/domain/use_case/chat_load_data_use_case.dart';

class ChatLoadDataUseCaseImpl implements ChatLoadDataUseCase {
  final ChatRepository _repo;

  const ChatLoadDataUseCaseImpl(this._repo);

  @override
  Future<List<Chat>> call() async {
    return await _repo.loadData();
  }
}