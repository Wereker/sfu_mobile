part of 'timetable_bloc.dart';

@freezed
class TimetableEvent with _$TimetableEvent {
  const factory TimetableEvent.loadData({
    required int userId,
    required TimetableTargetType userType,
  }) = _LoadData;

  const factory TimetableEvent.loadDataForTarget({
    required int searchId,
    required TimetableTargetType searchType,
  }) = _LoadDataForTarget;
}