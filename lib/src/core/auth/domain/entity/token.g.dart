// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Token _$TokenFromJson(Map<String, dynamic> json) => _Token(
  access: json['access'] as String,
  refresh: json['refresh'] as String,
  type: json['type'] as String,
  expires: (json['expires'] as num).toInt(),
);

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
  'access': instance.access,
  'refresh': instance.refresh,
  'type': instance.type,
  'expires': instance.expires,
};
