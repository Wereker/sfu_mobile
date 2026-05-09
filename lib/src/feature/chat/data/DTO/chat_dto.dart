// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/chat/message/data/dto/message_dto.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class ChatDTO with _$ChatDTO {
  const factory ChatDTO({
    required String id,
    required String type,
    required String title,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'participant_ids') @Default([]) List<String> participantIds,
    @JsonKey(
      name: 'last_message',
      fromJson: _messageDTOFromJson,
      toJson: _messageDTOToJson,
    )
    MessageDTO? lastMessage,
    @JsonKey(name: 'last_message_at') String? lastMessageAt,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);
}

// Хелперы для вложенного объекта
MessageDTO? _messageDTOFromJson(Map<String, dynamic>? json) =>
    json == null ? null : MessageDTO.fromJson(json);

Map<String, dynamic>? _messageDTOToJson(MessageDTO? dto) => dto?.toJson();
