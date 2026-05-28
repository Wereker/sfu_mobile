// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_student_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagedStudentDTO _$ManagedStudentDTOFromJson(Map<String, dynamic> json) =>
    _ManagedStudentDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      groupId: json['group_id'] as String,
      groupName: json['group_name'] as String? ?? '',
      stream: json['stream'] as String? ?? '',
      isHeadman: json['is_headman'] as bool? ?? false,
      phone: json['phone'] as String?,
      telegram: json['telegram'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$ManagedStudentDTOToJson(_ManagedStudentDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'group_id': instance.groupId,
      'group_name': instance.groupName,
      'stream': instance.stream,
      'is_headman': instance.isHeadman,
      'phone': instance.phone,
      'telegram': instance.telegram,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };
