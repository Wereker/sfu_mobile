// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonDTO _$LessonDTOFromJson(Map<String, dynamic> json) => _LessonDTO(
  id: json['id'] as String,
  day: json['day'] as String,
  timeStart: json['time_start'] as String,
  timeEnd: json['time_end'] as String,
  subject: json['subject'] as String,
  type: json['lesson_type'] as String? ?? '',
  place: json['place'] as String? ?? '',
  building: json['building'] as String? ?? '',
  room: json['room'] as String? ?? '',
  teacher: json['teacher'] as String? ?? '',
  teacherId: json['teacher_id'] as String?,
  groups:
      (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  sync: json['sync'] as String? ?? '',
);

Map<String, dynamic> _$LessonDTOToJson(_LessonDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'time_start': instance.timeStart,
      'time_end': instance.timeEnd,
      'subject': instance.subject,
      'lesson_type': instance.type,
      'place': instance.place,
      'building': instance.building,
      'room': instance.room,
      'teacher': instance.teacher,
      'teacher_id': instance.teacherId,
      'groups': instance.groups,
      'sync': instance.sync,
    };
