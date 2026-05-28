import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Dio _authorizedClient;

  const ChatRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<ChatDTO>> getChats() => ExceptionHandler.handle(() async {
    final response =
    await _authorizedClient.get<List<dynamic>>('/chats');

    return (response.data ?? [])
        .map((e) => ChatDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  });

  @override
  Future<ChatDTO> openDirectChat(int userId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .post<Map<String, dynamic>>('/chats/direct/$userId');
        return ChatDTO.fromJson(response.data!);
      });

  @override
  Future<List<MessageDTO>> getMessages(int chatId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .get<List<dynamic>>('/chats/$chatId/messages');
        return (response.data ?? [])
            .map((e) => MessageDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });
}