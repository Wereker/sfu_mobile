// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
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
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fatherName': instance.fatherName,
  'birthdate': instance.birthdate?.toIso8601String(),
  'sex': instance.sex,
  'phone': instance.phone,
  'role': instance.role,
};
