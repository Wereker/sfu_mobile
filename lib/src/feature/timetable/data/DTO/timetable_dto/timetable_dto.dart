// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/feature/timetable/data/dto/week_dto/week_dto.dart';

part 'timetable_dto.freezed.dart';
part 'timetable_dto.g.dart';

@freezed
abstract class TimetableDTO with _$TimetableDTO {
  const factory TimetableDTO({
    required String target,
    required String type,
    String? institute,
    @JsonKey(
      fromJson: _weekListFromJson,
      toJson:   _weekListToJson,
    )
    required List<WeekDTO> weeks,
  }) = _TimetableDTO;

  factory TimetableDTO.fromJson(Map<String, dynamic> json) =>
      _$TimetableDTOFromJson(json);
}

List<WeekDTO> _weekListFromJson(List<dynamic> json) =>
    json.map((e) => WeekDTO.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> _weekListToJson(List<WeekDTO> list) =>
    list.map((e) => e.toJson()).toList();