part of 'attendance_session_bloc.dart';

@freezed
abstract class AttendanceSessionEvent with _$AttendanceSessionEvent {
  const factory AttendanceSessionEvent.createSession(int lessonId) =
  _CreateSession;

  const factory AttendanceSessionEvent.loadStudents(int lessonId) =
  _LoadStudents;

  const factory AttendanceSessionEvent.markManual({
    required int lessonId,
    required int studentId,
  }) = _MarkManual;

  const factory AttendanceSessionEvent.refresh(int lessonId) = _Refresh;
}