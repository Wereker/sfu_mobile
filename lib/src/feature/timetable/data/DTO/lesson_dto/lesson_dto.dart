// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_dto.freezed.dart';
part 'lesson_dto.g.dart';

@freezed
abstract class LessonDTO with _$LessonDTO {
  const factory LessonDTO({
    required String id,
    required String day,
    @JsonKey(name: 'time_start') required String timeStart,
    @JsonKey(name: 'time_end')   required String timeEnd,
    required String subject,
    @JsonKey(name: 'lesson_type') @Default('') String type,
    @Default('') String place,
    @Default('') String building,
    @Default('') String room,
    @Default('') String teacher,
    @JsonKey(name: 'teacher_id') String? teacherId,
    @Default([]) List<String> groups,
    @Default('') String sync,
  }) = _LessonDTO;

  factory LessonDTO.fromJson(Map<String, dynamic> json) =>
      _$LessonDTOFromJson(json);
}