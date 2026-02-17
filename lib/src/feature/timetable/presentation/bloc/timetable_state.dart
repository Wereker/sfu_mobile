part of 'timetable_bloc.dart';

@freezed
class TimetableState with _$TimetableState {
  const factory TimetableState.initial() = _TimetableInitial;

  const factory TimetableState.loading() = _TimetableLoading;

  const factory TimetableState.success(Timetable timetable) = _TimetableSuccess;

  const factory TimetableState.error({required String error}) = _TimetableError;
}