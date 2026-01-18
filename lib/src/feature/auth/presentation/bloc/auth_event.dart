part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String login,
    required String password,
  }) = _AuthSignIn;

  const factory AuthEvent.resetPassword({
    required String newPassword,
  }) = _AuthResetPassword;

  const factory AuthEvent.signUp({
    required String login,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) = _AuthSignUp;
}
