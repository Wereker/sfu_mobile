part of 'timetable_bloc.dart';

@freezed
class TimetableEvent with _$TimetableEvent {
  const factory TimetableEvent.loadData() = _LoadData;
  const factory TimetableEvent.loadDataForTarget(String target) =
      _LoadDataForTarget;
}
