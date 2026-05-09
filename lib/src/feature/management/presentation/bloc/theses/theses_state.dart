part of 'theses_bloc.dart';

@freezed
class ThesesState with _$ThesesState {
  const factory ThesesState.initial() = _ThesesInitial;
  const factory ThesesState.loading() = _ThesesLoading;
  const factory ThesesState.success(List<Thesis> theses) = _ThesesSuccess;
  const factory ThesesState.error(String message) = _ThesesError;
}