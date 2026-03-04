import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/data/dto/chat_dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/domain/entity/message/message.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    required String id,
    required ChatType type,
    required String title,
    String? avatarUrl,
    required List<String> participantIds,
    required Message lastMessage,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Chat;

  static Chat fromDTO(ChatDTO dto) => Chat(
    id: dto.id,
    type: ChatType.values.firstWhere((e) => e.name == dto.type),
    title: dto.title,
    avatarUrl: dto.avatarUrl.isNotEmpty ? dto.avatarUrl : null,
    participantIds: dto.participantIds,
    lastMessage: Message.fromDTO(dto.lastMessage),
    lastMessageAt: dto.lastMessageAt.isNotEmpty ? DateTime.parse(dto.lastMessageAt) : null,
    unreadCount: int.tryParse(dto.unreadCount) ?? 0,
    createdAt: DateTime.parse(dto.createdAt),
    updatedAt: DateTime.parse(dto.updatedAt),
  );
}

enum ChatType {
  private, // Личный чат 1 на 1
  group, // Групповой чат
}
