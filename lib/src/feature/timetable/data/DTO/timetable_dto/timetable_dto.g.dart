// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimetableDTO _$TimetableDTOFromJson(Map<String, dynamic> json) =>
    _TimetableDTO(
      target: json['target'] as String,
      type: json['type'] as String,
      institute: json['institute'] as String?,
      weeks: _weekListFromJson(json['weeks'] as List),
    );

Map<String, dynamic> _$TimetableDTOToJson(_TimetableDTO instance) =>
    <String, dynamic>{
      'target': instance.target,
      'type': instance.type,
      'institute': instance.institute,
      'weeks': _weekListToJson(instance.weeks),
    };
