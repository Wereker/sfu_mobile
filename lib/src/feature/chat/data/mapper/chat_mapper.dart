import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/data/mapper/message_mapper.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';

abstract class ChatMapper {
  static Chat fromDTO(ChatDTO dto) => Chat(
    id: dto.id,
    type: ChatType.values.firstWhere((e) => e.name == dto.type),
    title: dto.title,
    avatarUrl: dto.avatarUrl,
    participantIds: dto.participantIds,
    lastMessage: dto.lastMessage != null
        ? MessageMapper.fromDTO(dto.lastMessage!)
        : null,
    lastMessageAt: dto.lastMessageAt != null
        ? DateTime.parse(dto.lastMessageAt!)
        : null,
    unreadCount: dto.unreadCount,
    createdAt: DateTime.parse(dto.createdAt),
    updatedAt: DateTime.parse(dto.updatedAt),
  );
}
