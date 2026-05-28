// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThesisDTO _$ThesisDTOFromJson(Map<String, dynamic> json) => _ThesisDTO(
  id: json['id'] as String,
  title: json['title'] as String,
  teacherId: json['teacher_id'] as String,
  teacherName: json['teacher_name'] as String? ?? '',
  isFree: json['is_free'] as bool,
  takenBy: json['taken_by'] as String?,
  takenById: json['taken_by_id'] as String?,
);

Map<String, dynamic> _$ThesisDTOToJson(_ThesisDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'teacher_id': instance.teacherId,
      'teacher_name': instance.teacherName,
      'is_free': instance.isFree,
      'taken_by': instance.takenBy,
      'taken_by_id': instance.takenById,
    };
