import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/auth/domain/exception/invalid_credentials_error.dart';
import 'package:sfu/src/core/auth/domain/exception/network_error.dart';
import 'package:sfu/src/core/auth/domain/exception/password_error.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthBloc({
    required this.signUpUseCase,
    required this.resetPasswordUseCase,
    required this.logoutUseCase,
    required this.signInUseCase,
    required this.checkAuthStatusUseCase,
  }) : super(AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      signIn: (login, password) async {
        emit(AuthState.loading());

        try {
          await signInUseCase.call(login, password);
          emit(AuthState.authorized());
        } on InvalidCredentialsError {
          emit(AuthState.error(error: "Неверный логин или пароль"));
        } on NetworkError {
          emit(AuthState.error(error: "Не подключения к интернету"));
        } catch (_) {
          emit(AuthState.error(error: "Ошибка авторизации"));
        }
      },
      resetPassword: (password) async {
        emit(AuthState.loading());
        try {
          await resetPasswordUseCase.call(password);
          emit(AuthState.unauthorized());
        } on NetworkError {
          emit(AuthState.error(error: "Ошибка подключения к интернету"));
        } on PasswordMatchError {
          emit(AuthState.error(error: "Пароли не совпадают"));
        } catch (_) {
          emit(AuthState.error(error: "Ошибка авторизации"));
        }
      },
      logout: () async {
        try {
          emit(AuthState.loading());
          await logoutUseCase.call();
          emit(AuthState.unauthorized());
        } on NetworkError {
          emit(AuthState.error(error: "Ошибка подключения к интернету"));
        } catch (_) {
          emit(AuthState.error(error: "Ошибка авторизации"));
        }
      },
      signUp:
          (
            String login,
            String password1,
            String password2,
            String firstName,
            String lastName,
          ) async {
            emit(AuthState.loading());
            try {
              await signUpUseCase.call(
                login: login,
                password1: password1,
                password2: password2,
                firstName: firstName,
                lastName: lastName,
              );
              emit(AuthState.unauthorized());
            } on InvalidCredentialsError {
              emit(AuthState.error(error: "Неккоректно введены данные"));
            } on NetworkError {
              emit(AuthState.error(error: "Ошибка подключения к интернету"));
            } catch (_) {
              emit(AuthState.error(error: "Ошибка авторизации"));
            }
          },
      checkAuthStatus: () async {
        emit(AuthState.loading());

        try {
          await checkAuthStatusUseCase.call();
          // emit(AuthState.authorized());
          emit(AuthState.unauthorized());
        } catch (_) {
          emit(AuthState.unauthorized());
        }
      },
    );
  }
}
