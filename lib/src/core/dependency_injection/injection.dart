import 'package:get_it/get_it.dart';
import 'package:sfu/src/core/auth/data/repository/auth_repository_mock.dart';
import 'package:sfu/src/core/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/check_auth_status_use_case_impl.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/logout_use_case_impl.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/reset_password_use_case_impl.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_in_use_case_impl.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case.dart';
import 'package:sfu/src/core/auth/domain/use_case/sign_up_use_case_impl.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Repositories
  _initRepositories();

  // Use Cases
  _initUseCases();

  // Bloc
  _initBloc();
}

void _initRepositories() {
  sl.registerSingleton<AuthRepository>(AuthRepositoryMock());
}

void _initUseCases() {
  sl.registerFactory<SignInUseCase>(
    () => SignInUseCaseImpl(sl<AuthRepository>()),
  );
  sl.registerFactory<SignUpUseCase>(
    () => SignUpUseCaseImpl(sl<AuthRepository>()),
  );
  sl.registerFactory<LogoutUseCase>(
    () => LogoutUseCaseImpl(sl<AuthRepository>()),
  );
  sl.registerFactory<ResetPasswordUseCase>(
    () => ResetPasswordUseCaseImpl(sl<AuthRepository>()),
  );
  sl.registerFactory<CheckAuthStatusUseCase>(
    () => CheckAuthStatusUseCaseImpl(sl<AuthRepository>()),
  );
}

void _initBloc() {
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      signUpUseCase: sl<SignUpUseCase>(),
      resetPasswordUseCase: sl<ResetPasswordUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      signInUseCase: sl<SignInUseCase>(),
      checkAuthStatusUseCase: sl<CheckAuthStatusUseCase>(),
    ),
  );
}
