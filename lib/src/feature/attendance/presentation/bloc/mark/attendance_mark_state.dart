part of 'attendance_mark_bloc.dart';

@freezed
class AttendanceMarkState with _$AttendanceMarkState {
  const factory AttendanceMarkState.initial() = _Initial;
  const factory AttendanceMarkState.marking() = _Marking;
  const factory AttendanceMarkState.markSuccess(AttendanceRecord record) =
      _MarkSuccess;
  const factory AttendanceMarkState.historyLoading() = _HistoryLoading;
  const factory AttendanceMarkState.historySuccess(
    List<AttendanceRecord> records,
  ) = _HistorySuccess;
  const factory AttendanceMarkState.error(String message) = _Error;
}
