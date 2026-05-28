// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discipline_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DisciplineDTO _$DisciplineDTOFromJson(Map<String, dynamic> json) =>
    _DisciplineDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      teacherId: json['teacher_id'] as String,
      teacherName: json['teacher_name'] as String? ?? '',
      credits: (json['credits'] as num?)?.toInt() ?? 0,
      level: json['level'] as String,
      totalSeats: (json['total_seats'] as num?)?.toInt() ?? 0,
      takenSeats: (json['taken_seats'] as num?)?.toInt() ?? 0,
      isEnrolled: json['is_enrolled'] as bool? ?? false,
    );

Map<String, dynamic> _$DisciplineDTOToJson(_DisciplineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teacher_id': instance.teacherId,
      'teacher_name': instance.teacherName,
      'credits': instance.credits,
      'level': instance.level,
      'total_seats': instance.totalSeats,
      'taken_seats': instance.takenSeats,
      'is_enrolled': instance.isEnrolled,
    };
