import 'package:sfu/src/feature/chat/data/mapper/message_mapper.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';
import 'package:sfu/src/feature/chat/message/domain/repository/message_repository.dart';

class MessageRepositoryMock implements MessageRepository {
  final MessageRemoteDataSource _remote;

  const MessageRepositoryMock(this._remote);

  @override
  Future<List<Message>> getMessagesForChat(String chatId) async {
    final dtos = await _remote.getMessagesForChat(chatId);
    return dtos.map(MessageMapper.fromDTO).toList();
  }
}
