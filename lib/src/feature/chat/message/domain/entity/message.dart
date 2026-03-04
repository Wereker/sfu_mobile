import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/data/DTO/message_dto.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String chatId,
    required String senderId,
    required String text,
    required DateTime sentAt,
    required MessageStatus status,
    DateTime? deliveredAt,
    DateTime? readAt,
    required bool isOutgoing,
    @Default(false) bool isEdited,
    required DateTime createdAt,
  }) = _Message;
  
  static Message fromDTO(MessageDTO dto) => Message(
    id: dto.id,
    chatId: dto.chatId,
    senderId: dto.senderId,
    text: dto.text,
    sentAt: DateTime.parse(dto.sentAt),
    status: MessageStatus.values.firstWhere((e) => e.name == dto.status),
    deliveredAt: dto.deliveredAt.isNotEmpty ? DateTime.parse(dto.deliveredAt) : null,
    readAt: dto.readAt.isNotEmpty ? DateTime.parse(dto.readAt) : null,
    isOutgoing: dto.isOutgoing == 'true',
    isEdited: dto.isEdited == 'true',
    createdAt: DateTime.parse(dto.createdAt),
  );
}

enum MessageStatus {
  sent, // Отправлено (на сервере)
  delivered, // Доставлено (собеседник получил)
  read, // Прочитано (собеседник открыл чат)
}
