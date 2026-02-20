// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonDTO _$LessonDTOFromJson(Map<String, dynamic> json) => _LessonDTO(
  day: json['day'] as String,
  time: json['time'] as String,
  subject: json['subject'] as String,
  type: json['type'] as String,
  place: json['place'] as String,
  building: json['building'] as String,
  sync: json['sync'] as String,
  teacher: json['teacher'] as String? ?? '',
  groups:
      (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$LessonDTOToJson(_LessonDTO instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'subject': instance.subject,
      'type': instance.type,
      'place': instance.place,
      'building': instance.building,
      'sync': instance.sync,
      'teacher': instance.teacher,
      'groups': instance.groups,
    };
