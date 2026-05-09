// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';

part 'week_dto.freezed.dart';
part 'week_dto.g.dart';

@freezed
abstract class WeekDTO with _$WeekDTO {
  const factory WeekDTO({
    required String week,
    @JsonKey(
      fromJson: _lessonListFromJson,
      toJson:   _lessonListToJson,
    )
    required List<LessonDTO> lessons,
  }) = _WeekDTO;

  factory WeekDTO.fromJson(Map<String, dynamic> json) =>
      _$WeekDTOFromJson(json);
}

List<LessonDTO> _lessonListFromJson(List<dynamic> json) =>
    json.map((e) => LessonDTO.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> _lessonListToJson(List<LessonDTO> list) =>
    list.map((e) => e.toJson()).toList();