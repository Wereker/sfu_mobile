import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source.dart';

class MessageRemoteDataSourceMock implements MessageRemoteDataSource {
  @override
  Future<List<MessageDTO>> getMessagesForChat(String chatId) async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString('lib/src/core/mock/messages.json');
    final Map<String, dynamic> json = jsonDecode(raw);

    final List<dynamic>? messages = json[chatId];
    if (messages == null) return [];

    return messages
        .map((item) => MessageDTO.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
