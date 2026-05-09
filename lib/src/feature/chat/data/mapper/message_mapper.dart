import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

abstract class MessageMapper {
  static Message fromDTO(MessageDTO dto) => Message(
    id:          dto.id,
    chatId:      dto.chatId,
    senderId:    dto.senderId,
    senderName:  dto.senderName,
    text:        dto.text,
    sentAt:      DateTime.parse(dto.sentAt),
    status:      MessageStatus.values.firstWhere((e) => e.name == dto.status),
    deliveredAt: dto.deliveredAt != null ? DateTime.parse(dto.deliveredAt!) : null,
    readAt:      dto.readAt      != null ? DateTime.parse(dto.readAt!)      : null,
    isOutgoing:  dto.isOutgoing,
    isEdited:    dto.isEdited,
    createdAt:   DateTime.parse(dto.createdAt),
  );
}