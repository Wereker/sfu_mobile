part of 'attendance_mark_bloc.dart';

@freezed
class AttendanceMarkEvent with _$AttendanceMarkEvent {
  const factory AttendanceMarkEvent.mark(String token) = _Mark;
  const factory AttendanceMarkEvent.loadHistory() = _LoadHistory;
}
