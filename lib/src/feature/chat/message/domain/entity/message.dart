import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String chatId,
    required String senderId,
    required String senderName,

    // — с сервера (WS и HTTP) —
    required String body,
    required DateTime createdAt,
    required bool isOutgoing,

    // — синтетика до появления на сервере —
    @Default(MessageStatus.sent) MessageStatus status,
    @Default(false) bool isEdited,
  }) = _Message;
}

enum MessageStatus { sent, delivered, read }