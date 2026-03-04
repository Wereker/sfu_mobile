import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/data/DTO/message_dto.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class ChatDTO with _$ChatDTO {
  const factory ChatDTO({
    required String id,
    required String type,
    required String title,
    @Default('') String avatarUrl,
    required List<String> participantIds,
    required MessageDTO lastMessage,
    @Default('') String lastMessageAt,
    @Default('0') String unreadCount ,
    required String createdAt,
    required String updatedAt,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Map<String, dynamic> json) => _$ChatDTOFromJson(json);
}