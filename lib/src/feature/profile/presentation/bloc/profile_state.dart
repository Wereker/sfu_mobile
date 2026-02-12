part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _ProfileInitial;

  const factory ProfileState.loading() = _ProfileLoading;

  const factory ProfileState.success(User user) = _ProfileSucces;

  const factory ProfileState.error({required String error})= _ProfileError;
}