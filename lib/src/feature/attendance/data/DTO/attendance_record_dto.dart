import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_record_dto.freezed.dart';
part 'attendance_record_dto.g.dart';

/// Используется для:
/// POST /attendance/scan/{token}
/// POST /attendance/manual/{lesson_id}/{student_id}
/// GET  /attendance/lesson/{lesson_id}
/// GET  /attendance/student/{student_id}
@freezed
abstract class AttendanceRecordDTO with _$AttendanceRecordDTO {
  const factory AttendanceRecordDTO({
    @JsonKey(fromJson: _intToString) required String id,
    @JsonKey(name: 'lesson_id', fromJson: _intToString) required String lessonId,
    @JsonKey(name: 'student_id', fromJson: _intToString) required String studentId,
    @JsonKey(name: 'marked_via') required String markedVia, // 'qr' | 'manual'
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _AttendanceRecordDTO;

  factory AttendanceRecordDTO.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();