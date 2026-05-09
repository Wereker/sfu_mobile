// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  fatherName: json['fatherName'] as String?,
  birthdate: json['birthdate'] == null
      ? null
      : DateTime.parse(json['birthdate'] as String),
  sex: json['sex'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  institute: json['institute'] as String?,
  groupId: json['groupId'] as String?,
  groupName: json['groupName'] as String?,
  stream: json['stream'] as String?,
  subgroup: json['subgroup'] as String?,
  recordBookNumber: json['recordBookNumber'] as String?,
  position: json['position'] as String?,
  degree: json['degree'] as String?,
  office: json['office'] as String?,
  bio: json['bio'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fatherName': instance.fatherName,
  'birthdate': instance.birthdate?.toIso8601String(),
  'sex': instance.sex,
  'phone': instance.phone,
  'role': instance.role,
  'avatarUrl': instance.avatarUrl,
  'institute': instance.institute,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'stream': instance.stream,
  'subgroup': instance.subgroup,
  'recordBookNumber': instance.recordBookNumber,
  'position': instance.position,
  'degree': instance.degree,
  'office': instance.office,
  'bio': instance.bio,
  'tags': instance.tags,
};
