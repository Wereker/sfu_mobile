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
import 'package:sfu/src/feature/profile/domain/use_case/profile_load_data_use_case.dart';
import 'package:sfu/src/feature/profile/domain/use_case/profile_load_data_use_case_impl.dart';
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
import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/data/repository/timetable_repository_impl.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data__for_group_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_group_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_teacher_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_teacher_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

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

  sl.registerSingleton<TimetableLocalDataSource>(
    TimetableLocalDataSourceImpl(),
  );
  sl.registerSingleton<TimetableRemoteDataSource>(
    TimetableRemoteDataSourceImpl(),
  );
}

void _initRepositories() {
  sl.registerSingleton<AuthRepository>(AuthRepositoryMock());
  sl.registerSingleton<ProfileRepository>(ProfileRepositroyMock());
  sl.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(sl<SettingsLocalDataSource>()),
  );
  sl.registerSingleton<TimetableRepository>(
    TimetableRepositoryImpl(
      locale: sl<TimetableLocalDataSource>(),
      remote: sl<TimetableRemoteDataSource>(),
    ),
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

  sl.registerFactory<ProfileLoadDataUseCase>(
    () => ProfileLoadDataUseCaseImpl(sl<ProfileRepository>()),
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

  sl.registerFactory<TimetableLoadDataForTeacherUseCase>(
    () => TimetableLoadDataForTeacherUseCaseImpl(sl<TimetableRepository>()),
  );
  sl.registerFactory<TimetableLoadDataForGroupUseCase>(
    () => TimetableLoadDataForGroupUseCaseImpl(sl<TimetableRepository>()),
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
  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(sl<ProfileLoadDataUseCase>()),
  );
  sl.registerFactory<SettingsBloc>(
    () => SettingsBloc(
      updateAppThemeModeUseCase: sl<UpdateAppThemeModeUseCase>(),
      updateAppLocalizationUseCase: sl<UpdateAppLocalizationUseCase>(),
      getAppSettingsUseCase: sl<GetAppSettingsUseCase>(),
    ),
  );

  sl.registerFactory<TimetableBloc>(
    () => TimetableBloc(
      sl<TimetableLoadDataForGroupUseCase>(),
      sl<TimetableLoadDataForTeacherUseCase>(),
    ),
  );
}
