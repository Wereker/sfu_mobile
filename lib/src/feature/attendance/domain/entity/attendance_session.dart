import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_session.freezed.dart';

@freezed
abstract class AttendanceSession with _$AttendanceSession {
  const factory AttendanceSession({
    required String sessionId,
    required String token,
    required DateTime expiresAt,
  }) = _AttendanceSession;

  // bool get isExpired => DateTime.now().isAfter(expiresAt);
}
