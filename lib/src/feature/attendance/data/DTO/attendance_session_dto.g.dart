// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceSessionDTO _$AttendanceSessionDTOFromJson(
  Map<String, dynamic> json,
) => _AttendanceSessionDTO(
  id: _intToString(json['id']),
  lessonId: _intToString(json['lesson_id']),
  token: json['token'] as String,
  expiresAt: json['expires_at'] as String,
  isActive: json['is_active'] as bool? ?? true,
);

Map<String, dynamic> _$AttendanceSessionDTOToJson(
  _AttendanceSessionDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'lesson_id': instance.lessonId,
  'token': instance.token,
  'expires_at': instance.expiresAt,
  'is_active': instance.isActive,
};
