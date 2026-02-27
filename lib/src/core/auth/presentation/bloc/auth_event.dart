part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _AuthSignIn;

  const factory AuthEvent.resetPassword({
    required String newPassword,
  }) = _AuthResetPassword;

  const factory AuthEvent.signUp({
    required String email,
    required String password1,
    required String password2,
    required String name,
    required String role,
    required String group,
  }) = _AuthSignUp;

  const factory AuthEvent.logout() = _AuthLogout;

  const factory AuthEvent.checkAuthStatus() = _AuthCheckAuthStatus;
}
