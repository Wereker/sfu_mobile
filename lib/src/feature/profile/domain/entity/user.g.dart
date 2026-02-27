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
  phone: json['phone'] as String,
  role: json['role'] as String,
  institute: json['institute'] as String,
  group: json['group'] as String,
  subgroup: json['subgroup'] as String,
  recordBookNumber: json['recordBookNumber'] as String,
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
  'institute': instance.institute,
  'group': instance.group,
  'subgroup': instance.subgroup,
  'recordBookNumber': instance.recordBookNumber,
};
