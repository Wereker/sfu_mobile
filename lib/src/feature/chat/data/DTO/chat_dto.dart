import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class ChatDTO with _$ChatDTO {
  const factory ChatDTO({
    @JsonKey(fromJson: _intToString) required String id,
    required String type,
    @JsonKey(name: 'group_id') String? groupId,
    @Default([]) List<ChatMemberDTO> members,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);
}

@freezed
abstract class ChatMemberDTO with _$ChatMemberDTO {
  const factory ChatMemberDTO({
    @JsonKey(name: 'user_id', fromJson: _intToString) required String userId,
  }) = _ChatMemberDTO;

  factory ChatMemberDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();