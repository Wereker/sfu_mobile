import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/DTO/lesson_dto/lesson_dto.dart';

part 'week_dto.freezed.dart';
part 'week_dto.g.dart';

@freezed
abstract class WeekDTO with _$WeekDTO {
  const factory WeekDTO({
    required String week,
    required List<LessonDTO> lessons,
  }) = _WeekDTO;

  factory WeekDTO.fromJson(Map<String, dynamic> json) =>
      _$WeekDTOFromJson(json);
}