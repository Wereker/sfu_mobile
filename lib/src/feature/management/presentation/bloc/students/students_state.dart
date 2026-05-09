part of 'students_bloc.dart';

@freezed
class StudentsState with _$StudentsState {
  const factory StudentsState.initial() = _StudentsInitial;
  const factory StudentsState.loading() = _StudentsLoading;
  const factory StudentsState.success(List<ManagedStudent> students) =
      _StudentsSuccess;
  const factory StudentsState.error(String message) = _StudentsError;
}
