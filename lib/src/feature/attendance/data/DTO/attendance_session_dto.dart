// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_session_dto.freezed.dart';
part 'attendance_session_dto.g.dart';

@freezed
abstract class AttendanceSessionDTO with _$AttendanceSessionDTO {
  const factory AttendanceSessionDTO({
    @JsonKey(name: 'session_id') required String sessionId,
    required String token,
    @JsonKey(name: 'expires_at') required String expiresAt,
  }) = _AttendanceSessionDTO;

  factory AttendanceSessionDTO.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSessionDTOFromJson(json);
}