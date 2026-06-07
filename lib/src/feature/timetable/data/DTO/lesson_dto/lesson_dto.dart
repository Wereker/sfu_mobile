// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_dto.freezed.dart';
part 'lesson_dto.g.dart';

@freezed
abstract class LessonDTO with _$LessonDTO {
  const factory LessonDTO({
    @JsonKey(fromJson: _intToString) required String id,
    @JsonKey(name: 'group_id', fromJson: _intToString) required String groupId,
    @JsonKey(name: 'teacher_id', fromJson: _intToStringNullable) String? teacherId,
    @JsonKey(name: 'teacher_name') String? teacherName,
    @JsonKey(fromJson: _intToString) required String day,
    @JsonKey(fromJson: _intToString) required String week,
    @JsonKey(name: 'time_start') required String timeStart,
    @JsonKey(name: 'time_end') required String timeEnd,
    required String subject,
    @JsonKey(name: 'lesson_type') @Default('') String lessonType,
    @Default('') String room,
    @Default('') String building,
  }) = _LessonDTO;

  factory LessonDTO.fromJson(Map<String, dynamic> json) =>
      _$LessonDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();

String? _intToStringNullable(dynamic v) =>
    v?.toString();