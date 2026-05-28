import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_session_dto.freezed.dart';
part 'attendance_session_dto.g.dart';

/// POST /attendance/token/{lesson_id}
@freezed
abstract class AttendanceSessionDTO with _$AttendanceSessionDTO {
  const factory AttendanceSessionDTO({
    @JsonKey(fromJson: _intToString) required String id,
    @JsonKey(name: 'lesson_id', fromJson: _intToString) required String lessonId,
    required String token,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _AttendanceSessionDTO;

  factory AttendanceSessionDTO.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSessionDTOFromJson(json);
}

String _intToString(dynamic v) => v.toString();