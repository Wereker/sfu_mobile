// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekDTO _$WeekDTOFromJson(Map<String, dynamic> json) => _WeekDTO(
  week: json['week'] as String,
  lessons: _lessonListFromJson(json['lessons'] as List),
);

Map<String, dynamic> _$WeekDTOToJson(_WeekDTO instance) => <String, dynamic>{
  'week': instance.week,
  'lessons': _lessonListToJson(instance.lessons),
};
