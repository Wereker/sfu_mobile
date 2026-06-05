import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/data_source/ws/chat_ws_data_source.dart';
import 'package:sfu/src/feature/chat/data/mapper/chat_mapper.dart';
import 'package:sfu/src/feature/chat/message/data/mapper/message_mapper.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remote;
  final ChatWsDataSource _ws;
  final AuthLocalDataSource _local;

  const ChatRepositoryImpl({
    required ChatRemoteDataSource remote,
    required ChatWsDataSource ws,
    required AuthLocalDataSource local,
  })  : _remote = remote,
        _ws = ws,
        _local = local;

  @override
  Future<List<Chat>> getChats() => ExceptionHandler.handle(() async {
    final dtos = await _remote.getChats();
    return dtos.map(ChatMapper.fromDTO).toList();
  });

  @override
  Future<Chat> openDirectChat(int userId) =>
      ExceptionHandler.handle(() async {
        final dto = await _remote.openDirectChat(userId);
        return ChatMapper.fromDTO(dto);
      });

  @override
  Future<List<Message>> getMessages(int chatId) =>
      ExceptionHandler.handle(() async {
        final currentUserId = await _local.getAccessToken();
        final dtos = await _remote.getMessages(chatId);
        return dtos
            .map((dto) => MessageMapper.fromDTO(dto,
            currentUserId: currentUserId))
            .toList();
      });

  @override
  Stream<Message> connectToChat(int chatId) async* {
    final currentUserId = await _local.getAccessToken();
    yield* _ws
        .connect(chatId)
        .map((dto) => MessageMapper.fromDTO(dto, currentUserId: currentUserId));
  }

  @override
  void sendMessage(String text) => _ws.send(text);

  @override
  void disconnectFromChat() => _ws.disconnect();
}