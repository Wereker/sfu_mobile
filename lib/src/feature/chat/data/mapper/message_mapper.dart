import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class MessageMapper {
  static Message fromDTO(MessageDTO dto, {String? currentUserId}) => Message(
    id: dto.id,
    chatId: dto.chatId,
    senderId: dto.senderId,
    senderName: dto.senderName,
    body: dto.body,
    createdAt: DateTime.parse(dto.createdAt),
    isOutgoing: currentUserId != null
        ? dto.senderId == currentUserId
        : dto.isOutgoing,
  );
}