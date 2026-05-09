// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  fatherName: json['father_name'] as String?,
  birthdate: json['birthdate'] == null
      ? null
      : DateTime.parse(json['birthdate'] as String),
  sex: json['sex'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  institute: json['institute'] as String?,
  groupId: json['group_id'] as String?,
  groupName: json['group_name'] as String?,
  stream: json['stream'] as String?,
  subgroup: json['subgroup'] as String?,
  recordBookNumber: json['record_book_number'] as String?,
  position: json['position'] as String?,
  degree: json['degree'] as String?,
  office: json['office'] as String?,
  bio: json['bio'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'father_name': instance.fatherName,
  'birthdate': instance.birthdate?.toIso8601String(),
  'sex': instance.sex,
  'phone': instance.phone,
  'role': instance.role,
  'avatarUrl': instance.avatarUrl,
  'institute': instance.institute,
  'group_id': instance.groupId,
  'group_name': instance.groupName,
  'stream': instance.stream,
  'subgroup': instance.subgroup,
  'record_book_number': instance.recordBookNumber,
  'position': instance.position,
  'degree': instance.degree,
  'office': instance.office,
  'bio': instance.bio,
  'tags': instance.tags,
};
