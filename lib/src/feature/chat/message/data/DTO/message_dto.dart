import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDTO with _$MessageDTO {
  const factory MessageDTO({
    @JsonKey(fromJson: _intToString) required String id,
    @JsonKey(name: 'chat_id', fromJson: _intToString) required String chatId,
    @JsonKey(name: 'sender_id', fromJson: _intToString) required String senderId,
    required String body,
    @JsonKey(name: 'created_at') required String createdAt,
    // Поля которые могут прийти из HTTP-истории (не из WS)
    @JsonKey(name: 'sender_name') @Default('') String senderName,
    @Default(false) bool isOutgoing,
  }) = _MessageDTO;

  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();