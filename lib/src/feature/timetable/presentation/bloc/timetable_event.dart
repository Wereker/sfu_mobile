part of 'timetable_bloc.dart';

@freezed
class TimetableEvent with _$TimetableEvent {
  const factory TimetableEvent.loadDataForGroup() = _TimetableLoadDataForGroup;

  const factory TimetableEvent.loadDataForTeacher() = _TimetableLoadDataForTeacher;
}