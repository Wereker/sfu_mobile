part of 'attendance_session_bloc.dart';

@freezed
class AttendanceSessionEvent with _$AttendanceSessionEvent {
  const factory AttendanceSessionEvent.createSession(
    String lessonId, {
    @Default(300) int ttlSeconds,
  }) = _CreateSession;

  const factory AttendanceSessionEvent.closeSession(String sessionId) =
      _CloseSession;

  const factory AttendanceSessionEvent.loadStudents(String sessionId) =
      _LoadStudents;

  const factory AttendanceSessionEvent.updateStatus(
    String sessionId,
    String studentId,
    AttendanceStatus status,
  ) = _UpdateStatus;
}
