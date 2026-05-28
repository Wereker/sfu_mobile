import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/send_message_use_case.dart';

class SendMessageUseCaseImpl implements SendMessageUseCase {
  final ChatRepository _repo;
  const SendMessageUseCaseImpl(this._repo);

  @override
  void call(String text) => _repo.sendMessage(text);
}