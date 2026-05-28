part of 'attendance_session_bloc.dart';

@freezed
class AttendanceSessionState with _$AttendanceSessionState {
  const factory AttendanceSessionState.initial() = _Initial;
  const factory AttendanceSessionState.sessionLoading() = _SessionLoading;
  const factory AttendanceSessionState.sessionReady(
      AttendanceSession session) = _SessionReady;
  const factory AttendanceSessionState.studentsLoading() = _StudentsLoading;
  const factory AttendanceSessionState.studentsSuccess({
    AttendanceSession? session,
    required List<AttendanceStudent> students,
  }) = _StudentsSuccess;
  const factory AttendanceSessionState.error(String message) = _Error;
}