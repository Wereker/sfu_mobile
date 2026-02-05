import 'package:get_it/get_it.dart';
import 'package:sfu/src/feature/auth/data/repository/auth_repository_mock.dart';
import 'package:sfu/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:sfu/src/feature/auth/domain/use_case/logout_use_case.dart';
import 'package:sfu/src/feature/auth/domain/use_case/logout_use_case_impl.dart';
import 'package:sfu/src/feature/auth/domain/use_case/reset_password_use_case.dart';
import 'package:sfu/src/feature/auth/domain/use_case/reset_password_use_case_impl.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_in_use_case.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_in_use_case_impl.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:sfu/src/feature/auth/domain/use_case/sign_up_use_case_impl.dart';
import 'package:sfu/src/feature/auth/presentation/bloc/auth_bloc.dart';

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
  sl.registerFactory<SignInUseCase>(() => SignInUseCaseImpl(authRepo: sl()));
  sl.registerFactory<SignUpUseCase>(() => SignUpUseCaseImpl(authRepo: sl()));
  sl.registerFactory<LogoutUseCase>(() => LogoutUseCaseImpl(authRepo: sl()));
  sl.registerFactory<ResetPasswordUseCase>(() => ResetPasswordUseCaseImpl(authRepo: sl()));
}

void _initBloc() {
  sl.registerFactory<AuthBloc>(
        () => AuthBloc(
      signUpUseCase: sl(),
      resetPasswordUseCase: sl(),
      logoutUseCase: sl(),
      signInUseCase: sl(),
    ),
  );
}