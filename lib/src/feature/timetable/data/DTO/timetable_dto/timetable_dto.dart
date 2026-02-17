import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/DTO/week_dto/week_dto.dart';

part 'timetable_dto.freezed.dart';
part 'timetable_dto.g.dart';

@freezed
abstract class TimetableDTO with _$TimetableDTO {
  const factory TimetableDTO({
    required String target,
    required String type,
    required String institute,
    required List<WeekDTO> weeks,
  }) = _TimetableDTO;

  factory TimetableDTO.fromJson(Map<String, dynamic> json) =>
      _$TimetableDTOFromJson(json);
}
