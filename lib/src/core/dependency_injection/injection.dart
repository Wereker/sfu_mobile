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
import 'package:sfu/src/feature/profile/data/repository/profile_repositroy_mock.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/load_data_use_case.dart';
import 'package:sfu/src/feature/profile/domain/use_case/load_data_use_case_impl.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/core/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:sfu/src/core/settings/data/data_source/local/settings_local_data_source_impl.dart';
import 'package:sfu/src/core/settings/data/repository/settings_repository_impl.dart';
import 'package:sfu/src/core/settings/domain/repository/settings_repository.dart';
import 'package:sfu/src/core/settings/domain/use_case/get_app_settings_use_case.dart';
import 'package:sfu/src/core/settings/domain/use_case/get_app_settings_use_case_impl.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_localization_use_case.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_localization_use_case_impl.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_theme_mode_use_case.dart';
import 'package:sfu/src/core/settings/domain/use_case/update_app_theme_mode_use_case_impl.dart';
import 'package:sfu/src/core/settings/presentation/bloc/settings_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Data Sources
  _initDataSources();

  // Repositories
  _initRepositories();

  // Use Cases
  _initUseCases();

  // Bloc
  _initBloc();
}

void _initDataSources() {
  sl.registerSingleton<SettingsLocalDataSource>(SettingsLocalDataSourceImpl());
}

void _initRepositories() {
  sl.registerSingleton<AuthRepository>(AuthRepositoryMock());
  sl.registerSingleton<ProfileRepository>(ProfileRepositroyMock());
  sl.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(sl<SettingsLocalDataSource>()),
  );
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

  sl.registerFactory<LoadDataUseCase>(
    () => LoadDataUseCaseImpl(sl<ProfileRepository>()),
  );

  sl.registerFactory<GetAppSettingsUseCase>(
    () => GetAppSettingsUseCaseImpl(sl<SettingsRepository>()),
  );
  sl.registerFactory<UpdateAppLocalizationUseCase>(
    () => UpdateAppLocalizationUseCaseImpl(sl<SettingsRepository>()),
  );
  sl.registerFactory<UpdateAppThemeModeUseCase>(
    () => UpdateAppThemeModeUseCaseImpl(sl<SettingsRepository>()),
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
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl<LoadDataUseCase>()));
  sl.registerFactory<SettingsBloc>(
    () => SettingsBloc(
      updateAppThemeModeUseCase: sl<UpdateAppThemeModeUseCase>(),
      updateAppLocalizationUseCase: sl<UpdateAppLocalizationUseCase>(),
      getAppSettingsUseCase: sl<GetAppSettingsUseCase>(),
    ),
  );
}
