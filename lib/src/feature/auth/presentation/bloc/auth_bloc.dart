import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/domain/entity/user.dart';
import 'package:sfu/src/feature/auth/domain/extention/auth_extention.dart';
import 'package:sfu/src/feature/auth/domain/usecase/logout_usecase.dart';
import 'package:sfu/src/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:sfu/src/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:sfu/src/feature/auth/domain/usecase/singup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.signUpUseCase,
    required this.resetPasswordUseCase,
    required this.logoutUseCase,
    required this.signInUseCase,
  }) : super(AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      signIn: (login, password) async {
        emit(AuthState.loading());

        try {
          final user = await signInUseCase.call(SignInParams(login, password));
          emit(AuthState.success(user: user));
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
          emit(AuthState.initial());
        } on NetworkError {
          emit(AuthState.error(error: "Ошибка подключения к интернету"));
        } on PasswordMatchError {
          emit(AuthState.error(error: "Пароли не совпадают"));
        } catch (_) {
          emit(AuthState.error(error: "Ошибка авторизации"));
        }
      },
      signUp: (login, password, firstName, lastName, phone) async {
        emit(AuthState.loading());
        try {
          await signUpUseCase.call(
            SignUpParams(
              login: login,
              password: password,
              firstName: firstName,
              lastName: lastName,
              phone: phone,
            ),
          );
          emit(AuthState.initial());
        } on InvalidCredentialsError {
          emit(AuthState.error(error: "Неккоректно введены данные"));
        } on NetworkError {
          emit(AuthState.error(error: "Ошибка подключения к интернету"));
        } catch (_) {
          emit(AuthState.error(error: "Ошибка авторизации"));
        }
      },
    );
  }
}
