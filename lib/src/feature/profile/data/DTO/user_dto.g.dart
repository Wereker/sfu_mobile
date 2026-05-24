// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  id: (json['id'] as num).toInt(),
  firstName: json['name'] as String,
  lastName: json['surname'] as String,
  fatherName: json['patronymic'] as String?,
  email: json['email'] as String,
  role: json['role'] as String,
  isActive: json['is_active'] as bool,
  avatarUrl: json['avatar'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.firstName,
  'surname': instance.lastName,
  'patronymic': instance.fatherName,
  'email': instance.email,
  'role': instance.role,
  'is_active': instance.isActive,
  'avatar': instance.avatarUrl,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
