import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDTO with _$MessageDTO {
  const factory MessageDTO({
    required String id,
    required String chatId,
    required String senderId,
    required String text,
    required String sentAt,
    required String status,
    @Default('') String deliveredAt,
    @Default('') String readAt,
    required String isOutgoing,
    @Default('false') String isEdited,
    required String createdAt,
  }) = _MessageDTO;

  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);
}
