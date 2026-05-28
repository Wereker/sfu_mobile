// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDTO _$EventDTOFromJson(Map<String, dynamic> json) => _EventDTO(
  id: _intToString(json['id']),
  title: json['title'] as String,
  annotation: json['annotation'] as String,
  startsAt: json['starts_at'] as String,
  endsAt: json['ends_at'] as String,
  room: RoomDTO.fromJson(json['room'] as Map<String, dynamic>),
  imageUrl: json['image_url'] as String?,
  creatorId: _intToString(json['creator_id']),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$EventDTOToJson(_EventDTO instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'annotation': instance.annotation,
  'starts_at': instance.startsAt,
  'ends_at': instance.endsAt,
  'room': instance.room,
  'image_url': instance.imageUrl,
  'creator_id': instance.creatorId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
