// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceRecordDTO _$AttendanceRecordDTOFromJson(Map<String, dynamic> json) =>
    _AttendanceRecordDTO(
      id: _intToString(json['id']),
      lessonId: _intToString(json['lesson_id']),
      studentId: _intToString(json['student_id']),
      markedVia: json['marked_via'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AttendanceRecordDTOToJson(
  _AttendanceRecordDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'lesson_id': instance.lessonId,
  'student_id': instance.studentId,
  'marked_via': instance.markedVia,
  'created_at': instance.createdAt,
};
