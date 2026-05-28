import 'package:sfu/src/feature/chat/data/dto/chat_dto.dart';
import 'package:sfu/src/feature/chat/domain/entity/chat.dart';

abstract class ChatMapper {
  static Chat fromDTO(ChatDTO dto) => Chat(
    id: dto.id,
    type: dto.type == 'group' ? ChatType.group : ChatType.private,
    groupId: dto.groupId,
    memberIds: dto.members.map((m) => m.userId).toList(),

    // Синтетика — сервер пока не отдаёт
    title: _mockTitle(dto),
    avatarUrl: null,
    lastMessage: null,
    lastMessageAt: null,
    unreadCount: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  /// Пока сервер не отдаёт название чата — генерируем из типа и id.
  /// Когда появится эндпоинт с именами участников — заменить здесь.
  static String _mockTitle(ChatDTO dto) {
    if (dto.type == 'group') {
      return dto.groupId != null
          ? 'Группа ${dto.groupId}'
          : 'Групповой чат';
    }

    return 'Чат #${dto.id}';
  }
}