// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffMemberDTO _$StaffMemberDTOFromJson(Map<String, dynamic> json) =>
    _StaffMemberDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      degree: json['degree'] as String? ?? '',
      email: json['email'] as String,
      phone: json['phone'] as String?,
      telegram: json['telegram'] as String?,
      office: json['office'] as String?,
      bio: json['bio'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$StaffMemberDTOToJson(_StaffMemberDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'degree': instance.degree,
      'email': instance.email,
      'phone': instance.phone,
      'telegram': instance.telegram,
      'office': instance.office,
      'bio': instance.bio,
      'tags': instance.tags,
      'avatar_url': instance.avatarUrl,
    };
