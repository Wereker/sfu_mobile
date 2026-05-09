import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/core/mock/mock_delay.dart';
import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';

class ChatRemoteDataSourceMock implements ChatRemoteDataSource {
  @override
  Future<List<ChatDTO>> loadChatForUser() async {
    await MockDelay.apply();

    final raw = await rootBundle.loadString('lib/src/core/mock/chats.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;

    return (json['data'] as List)
        .map((item) => ChatDTO.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
