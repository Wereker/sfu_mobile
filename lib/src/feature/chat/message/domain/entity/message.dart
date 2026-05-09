import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String        id,
    required String        chatId,
    required String        senderId,
    required String        senderName,
    required String        text,
    required DateTime      sentAt,
    required MessageStatus status,
    DateTime? deliveredAt,
    DateTime? readAt,
    required bool isOutgoing,
    @Default(false) bool  isEdited,
    required DateTime createdAt,
  }) = _Message;
}

enum MessageStatus { sent, delivered, read }
