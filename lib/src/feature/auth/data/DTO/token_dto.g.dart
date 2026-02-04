// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenDTO _$TokenDTOFromJson(Map<String, dynamic> json) => _TokenDTO(
  access: json['access_token'] as String,
  refresh: json['refresh_token'] as String,
  type: json['token_type'] as String,
  expires: json['expires_in'] as String,
);

Map<String, dynamic> _$TokenDTOToJson(_TokenDTO instance) => <String, dynamic>{
  'access_token': instance.access,
  'refresh_token': instance.refresh,
  'token_type': instance.type,
  'expires_in': instance.expires,
};
