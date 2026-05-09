import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDTO with _$MessageDTO {
  const factory MessageDTO({
    required String  id,
    @JsonKey(name: 'chat_id')     required String chatId,
    @JsonKey(name: 'sender_id')   required String senderId,
    @JsonKey(name: 'sender_name') @Default('') String senderName,
    required String  text,
    @JsonKey(name: 'sent_at')      required String sentAt,
    required String  status,
    @JsonKey(name: 'delivered_at')  String? deliveredAt,
    @JsonKey(name: 'read_at')       String? readAt,
    @JsonKey(name: 'is_outgoing')   required bool isOutgoing,
    @JsonKey(name: 'is_edited')     @Default(false) bool isEdited,
    @JsonKey(name: 'created_at')    required String createdAt,
  }) = _MessageDTO;

  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);
}
