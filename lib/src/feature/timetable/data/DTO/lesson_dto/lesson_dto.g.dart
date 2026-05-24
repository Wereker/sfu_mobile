// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonDTO _$LessonDTOFromJson(Map<String, dynamic> json) => _LessonDTO(
  id: _intToString(json['id']),
  groupId: _intToString(json['group_id']),
  teacherId: json['teacher_id'] as String?,
  teacherName: json['teacher_name'] as String?,
  day: _intToString(json['day']),
  week: _intToString(json['week']),
  timeStart: json['time_start'] as String,
  timeEnd: json['time_end'] as String,
  subject: json['subject'] as String,
  lessonType: json['lesson_type'] as String? ?? '',
  room: json['room'] as String? ?? '',
  building: json['building'] as String? ?? '',
);

Map<String, dynamic> _$LessonDTOToJson(_LessonDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'teacher_id': instance.teacherId,
      'teacher_name': instance.teacherName,
      'day': instance.day,
      'week': instance.week,
      'time_start': instance.timeStart,
      'time_end': instance.timeEnd,
      'subject': instance.subject,
      'lesson_type': instance.lessonType,
      'room': instance.room,
      'building': instance.building,
    };
