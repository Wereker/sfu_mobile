import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';
import 'package:sfu/src/core/error/app_exception.dart';
import 'package:sfu/src/core/error/auth_exception.dart';
import 'package:sfu/src/core/widgets/user_avatar.dart';

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
          await signInUseCase.call(email: login, password: password);
          emit(AuthState.authorized());
        } on UnauthorizedException {
          emit(AuthState.unauthorized());
        } on AppException catch (e) {
          emit(AuthState.error(error: e.message));
        } on Exception catch (_) {
          emit(AuthState.error(error: 'Что-то пошло не так'));
        }
      },
      resetPassword: (newPassword, confirmPassword) async {
        emit(AuthState.loading());
        try {
          await resetPasswordUseCase.call(
            newPassword: newPassword,
            confirmPassword: confirmPassword,
          );
          emit(AuthState.unauthorized());
        } on UnauthorizedException {
          emit(AuthState.unauthorized());
        } on AppException catch (e) {
          emit(AuthState.error(error: e.message));
        } on Exception catch (_) {
          emit(AuthState.error(error: 'Что-то пошло не так'));
        }
      },
      logout: () async {
        try {
          emit(AuthState.loading());
          await logoutUseCase.call();
          UserAvatar.clearAllCache();
          emit(AuthState.unauthorized());
        } on UnauthorizedException {
          emit(AuthState.unauthorized());
        } on AppException catch (e) {
          emit(AuthState.error(error: e.message));
        } on Exception catch (_) {
          emit(AuthState.error(error: 'Что-то пошло не так'));
        }
      },

      signUp: (
          String name,
          String surname,
          String patronymic,
          String email,
          String password1,
          String password2,
          int groupId,
          ) async {
        emit(AuthState.loading());
        try {
          await signUpUseCase.call(
            name: name,
            surname: surname,
            patronymic: patronymic,
            email: email,
            password1: password1,
            password2: password2,
            groupId: groupId,
          );
          emit(AuthState.registered(email: email));
        } on UnauthorizedException {
          emit(AuthState.unauthorized());
        } on AppException catch (e) {
          emit(AuthState.error(error: e.message));
        } on Exception catch (_) {
          emit(AuthState.error(error: 'Что-то пошло не так'));
        }
      },
      checkAuthStatus: () async {
        emit(AuthState.loading());

        try {
          await checkAuthStatusUseCase.call();
          emit(AuthState.authorized());
        } on UnauthorizedException {
          emit(AuthState.unauthorized());
        } on AppException catch (e) {
          emit(AuthState.error(error: e.message));
        } on Exception catch (_) {
          emit(AuthState.error(error: 'Что-то пошло не так'));
        }
      },
    );
  }
}
