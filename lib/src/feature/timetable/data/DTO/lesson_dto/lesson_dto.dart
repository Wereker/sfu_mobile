import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_dto.freezed.dart';
part 'lesson_dto.g.dart';

@freezed
abstract class LessonDTO with _$LessonDTO {
  const factory LessonDTO({
    required String day,
    required String time,
    required String subject,
    required String type,
    required String place,
    required String building,
    required String sync,
    @Default('') String teacher,
    @Default([]) List<String> groups,
  }) = _LessonDTO;

  factory LessonDTO.fromJson(Map<String, dynamic> json) =>
      _$LessonDTOFromJson(json);
}