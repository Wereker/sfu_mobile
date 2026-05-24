// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/dto/lesson_dto/lesson_dto.dart';

part 'week_dto.freezed.dart';

@freezed
abstract class WeekDTO with _$WeekDTO {
  const factory WeekDTO({
    required String week,
    required List<LessonDTO> lessons,
  }) = _WeekDTO;
}