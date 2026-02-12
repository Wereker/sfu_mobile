part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;

  const factory AuthState.loading() = _AuthLoading;

  const factory AuthState.unauthorized() = _AuthUnauthorized;

  const factory AuthState.authorized() = _AuthAuthorized;

  const factory AuthState.error({required String error}) = _AuthError;
}
