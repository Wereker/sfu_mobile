import 'package:dio/dio.dart';
import 'package:sfu/src/core/error/exception_handler.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final Dio _authorizedClient;

  const MessageRemoteDataSourceImpl({required Dio authorizedClient})
      : _authorizedClient = authorizedClient;

  @override
  Future<List<MessageDTO>> getMessagesForChat(String chatId) =>
      ExceptionHandler.handle(() async {
        final response = await _authorizedClient
            .get<List<dynamic>>('/chats/$chatId/messages');
        return (response.data ?? [])
            .map((e) => MessageDTO.fromJson(e as Map<String, dynamic>))
            .toList();
      });
}