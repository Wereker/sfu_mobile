import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_session.freezed.dart';

@freezed
abstract class AttendanceSession with _$AttendanceSession {
  const factory AttendanceSession({
    required String id,
    required String lessonId,
    required String token,
    required DateTime expiresAt,
    required bool isActive,
  }) = _AttendanceSession;

  const AttendanceSession._();
  bool get isExpired => DateTime.now().isAfter(expiresAt);
}