part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _AuthSignIn;

  const factory AuthEvent.signUp({
    required String name,
    required String surname,
    required String patronymic,
    required String email,
    required String password1,
    required String password2,
  }) = _AuthSignUp;

  const factory AuthEvent.resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) = _AuthResetPassword;

  const factory AuthEvent.logout() = _AuthLogout;

  const factory AuthEvent.checkAuthStatus() = _AuthCheckAuthStatus;
}