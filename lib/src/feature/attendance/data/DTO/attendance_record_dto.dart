// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_record_dto.freezed.dart';
part 'attendance_record_dto.g.dart';

@freezed
abstract class AttendanceRecordDTO with _$AttendanceRecordDTO {
  const factory AttendanceRecordDTO({
    required String id,
    required String lesson,
    required String date,
    required String status,
    @JsonKey(name: 'marked_at') required String markedAt,
  }) = _AttendanceRecordDTO;

  factory AttendanceRecordDTO.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordDTOFromJson(json);
}