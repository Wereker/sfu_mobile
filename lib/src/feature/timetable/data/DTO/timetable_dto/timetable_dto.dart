// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';

part 'timetable_dto.freezed.dart';

@freezed
abstract class TimetableDTO with _$TimetableDTO {
  const factory TimetableDTO({
    required String groupId,
    required List<WeekDTO> weeks,
  }) = _TimetableDTO;
}
