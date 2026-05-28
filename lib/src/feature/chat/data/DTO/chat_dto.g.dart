// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDTO _$ChatDTOFromJson(Map<String, dynamic> json) => _ChatDTO(
  id: _intToString(json['id']),
  type: json['type'] as String,
  groupId: json['group_id'] as String?,
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => ChatMemberDTO.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChatDTOToJson(_ChatDTO instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'group_id': instance.groupId,
  'members': instance.members,
};

_ChatMemberDTO _$ChatMemberDTOFromJson(Map<String, dynamic> json) =>
    _ChatMemberDTO(userId: _intToString(json['user_id']));

Map<String, dynamic> _$ChatMemberDTOToJson(_ChatMemberDTO instance) =>
    <String, dynamic>{'user_id': instance.userId};
