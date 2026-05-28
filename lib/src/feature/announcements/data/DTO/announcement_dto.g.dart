// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnouncementDTO _$AnnouncementDTOFromJson(Map<String, dynamic> json) =>
    _AnnouncementDTO(
      id: _intToString(json['id']),
      title: json['title'] as String,
      content: json['content'] as String,
      status: json['status'] as String,
      publishAt: json['publish_at'] as String,
      expiresAt: json['expires_at'] as String,
      authorId: _intToString(json['author_id']),
      createdAt: json['created_at'] as String,
      attachments: json['attachments'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$AnnouncementDTOToJson(_AnnouncementDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'publish_at': instance.publishAt,
      'expires_at': instance.expiresAt,
      'author_id': instance.authorId,
      'created_at': instance.createdAt,
      'attachments': instance.attachments,
    };
