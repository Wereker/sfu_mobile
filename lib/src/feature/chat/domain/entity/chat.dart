import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/domain/entity/message.dart';

part 'chat.freezed.dart';

@freezed
abstract class Chat with _$Chat {
  const factory Chat({
    // — с сервера —
    required String id,
    required ChatType type,
    String? groupId,
    required List<String> memberIds,  // user_id из members[]

    // — синтетика до появления на сервере —
    @Default('') String title,
    String? avatarUrl,
    Message? lastMessage,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Chat;
}

enum ChatType { group, private }