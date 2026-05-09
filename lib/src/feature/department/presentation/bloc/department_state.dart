part of 'department_bloc.dart';

@freezed
class DepartmentState with _$DepartmentState {
  const factory DepartmentState.initial() = _DepartmentInitial;
  const factory DepartmentState.loading() = _DepartmentLoading;
  const factory DepartmentState.success(List<StaffMember> staff) =
      _DepartmentSuccess;
  const factory DepartmentState.error(String message) = _DepartmentError;
}
