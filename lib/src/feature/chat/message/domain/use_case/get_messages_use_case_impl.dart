import 'package:sfu/src/core/error/data_exception.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/repository/message_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case.dart';

class GetMessagesUseCaseImpl implements GetMessagesUseCase {
  final MessageRepository _repo;
  const GetMessagesUseCaseImpl(this._repo);

  @override
  Future<List<Message>> call(String chatId) async {
    if (chatId.trim().isEmpty) {
      throw const ValidationException('Не указан идентификатор чата');
    }
    return ExceptionHandler.handle(
          () => _repo.getMessagesForChat(chatId),
    );
  }
}