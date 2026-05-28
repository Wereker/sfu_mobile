// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDTO _$MessageDTOFromJson(Map<String, dynamic> json) => _MessageDTO(
  id: _intToString(json['id']),
  chatId: _intToString(json['chat_id']),
  senderId: _intToString(json['sender_id']),
  body: json['body'] as String,
  createdAt: json['created_at'] as String,
  senderName: json['sender_name'] as String? ?? '',
  isOutgoing: json['isOutgoing'] as bool? ?? false,
);

Map<String, dynamic> _$MessageDTOToJson(_MessageDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sender_id': instance.senderId,
      'body': instance.body,
      'created_at': instance.createdAt,
      'sender_name': instance.senderName,
      'isOutgoing': instance.isOutgoing,
    };
