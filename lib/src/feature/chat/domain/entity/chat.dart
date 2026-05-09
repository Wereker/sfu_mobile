import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    required String   id,
    required ChatType type,
    required String   title,
    String? avatarUrl,
    required List<String> participantIds,
    Message?  lastMessage,      // nullable
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Chat;
}

enum ChatType { private, group }
