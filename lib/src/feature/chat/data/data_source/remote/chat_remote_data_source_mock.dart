import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

class ChatRemoteDataSourceMock implements ChatRemoteDataSource {
  @override
  Future<List<ChatDTO>> getChats() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final raw = await rootBundle.loadString('lib/src/core/mock/chats.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list.map((e) => ChatDTO.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<ChatDTO> openDirectChat(int userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final all = await getChats();
    return all.firstWhere(
          (c) => c.type == 'direct' && c.members.any((m) => m.userId == userId.toString()),
      orElse: () => ChatDTO(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        type: 'direct',
        members: [
          const ChatMemberDTO(userId: '1'),
          ChatMemberDTO(userId: userId.toString()),
        ],
      ),
    );
  }

  @override
  Future<List<MessageDTO>> getMessages(int chatId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final raw = await rootBundle.loadString('lib/src/core/mock/messages.json');
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final list = (map[chatId.toString()] as List<dynamic>?) ?? [];
    return list.map((e) => MessageDTO.fromJson(e as Map<String, dynamic>)).toList();
  }
}