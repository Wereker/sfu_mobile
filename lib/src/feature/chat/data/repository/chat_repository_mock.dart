import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/data_source/ws/chat_ws_data_source.dart';
import 'package:sfu/src/feature/chat/data/mapper/chat_mapper.dart';
import 'package:sfu/src/feature/chat/message/data/mapper/message_mapper.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

class ChatRepositoryMock implements ChatRepository {
  final ChatRemoteDataSource _remote;
  final ChatWsDataSource _ws;

  const ChatRepositoryMock({
    required ChatRemoteDataSource remote,
    required ChatWsDataSource ws,
  })  : _remote = remote,
        _ws = ws;

  @override
  Future<List<Chat>> getChats() async {
    final dtos = await _remote.getChats();
    return dtos.map(ChatMapper.fromDTO).toList();
  }

  @override
  Future<Chat> openDirectChat(int userId) async {
    final dto = await _remote.openDirectChat(userId);
    return ChatMapper.fromDTO(dto);
  }

  @override
  Future<List<Message>> getMessages(int chatId) async {
    final dtos = await _remote.getMessages(chatId);
    return dtos.map((dto) => MessageMapper.fromDTO(dto, currentUserId: '1')).toList();
  }

  @override
  Stream<Message> connectToChat(int chatId) =>
      _ws.connect(chatId).map((dto) => MessageMapper.fromDTO(dto, currentUserId: '1'));

  @override
  void sendMessage(String text) => _ws.send(text);

  @override
  void disconnectFromChat() => _ws.disconnect();
}