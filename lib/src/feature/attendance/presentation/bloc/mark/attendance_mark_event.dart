part of 'attendance_mark_bloc.dart';

@freezed
class AttendanceMarkEvent with _$AttendanceMarkEvent {
  const factory AttendanceMarkEvent.scan(String token) = _Scan;
  const factory AttendanceMarkEvent.loadHistory(int studentId) = _LoadHistory;
}