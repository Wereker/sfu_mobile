import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source_firebase_impl.dart';
import 'package:sfu/src/core/auth/data/repository/auth_repository_firebase_impl.dart';
import 'package:sfu/src/core/auth/data/repository/auth_repository_impl.dart';
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
import 'package:sfu/src/core/utils/loading_indicator/loading_indicator.dart';
import 'package:sfu/src/core/utils/loading_indicator/standard_loading_indicator.dart';
import 'package:sfu/src/feature/profile/data/repository/profile_repository_firebase_impl.dart';
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
import 'package:sfu/src/feature/timetable/data/repository/timetable_repository_firebase_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/data_source/remote/suggestion_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/data_source/remote/suggestion_remote_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/repository/suggestion_repository_impl.dart';
import 'package:sfu/src/feature/timetable/data/repository/timetable_repository_mock.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/repository/suggestion_repository.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_target_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_for_target_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/timetable_load_data_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/suggestions_load_use_case.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/suggestions_load_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  final secureStorage = const FlutterSecureStorage();

  _initLocalStorage(prefs, secureStorage);

  //Data Sources
  _initDataSources();

  // Repositories
  _initRepositories();

  // Use Cases
  _initUseCases();

  // Bloc
  _initBloc();

  // Widgets
  _initWidgets();
}

void _initLocalStorage(
  SharedPreferences prefs,
  FlutterSecureStorage storage,
) async {
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerSingleton<FlutterSecureStorage>(storage);
}

Future<void> _initDataSources() async {
  sl.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(
      sl.get<FlutterSecureStorage>(),
      sl.get<SharedPreferences>(),
    ),
  );
  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceFirebaseImpl(),
  );

  sl.registerSingleton<SettingsLocalDataSource>(
    SettingsLocalDataSourceImpl(sl.get<SharedPreferences>()),
  );

  sl.registerSingleton<TimetableRemoteDataSource>(
    TimetableRemoteDataSourceImpl(),
  );

  sl.registerSingleton<SuggestionRemoteDataSource>(
    SuggestionRemoteDataSourceImpl(),
  );
}

void _initRepositories() {
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryFirebaseImpl(
      local: sl<AuthLocalDataSource>(),
      remote: sl<AuthRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<ProfileRepository>(
    ProfileRepositoryFirebaseImpl(sl<AuthLocalDataSource>()),
  );
  sl.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(sl<SettingsLocalDataSource>()),
  );
  sl.registerSingleton<TimetableRepository>(
    TimetableRepositoryFirebaseImpl(
      locale: sl<AuthLocalDataSource>(),
      remote: sl<TimetableRemoteDataSource>(),
    ),
  );

  sl.registerSingleton<SuggestionRepository>(
    SuggestionRepositoryImpl(remote: sl<SuggestionRemoteDataSource>()),
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

  sl.registerFactory<TimetableLoadDataUseCase>(
    () => TimetableLoadDataUseCaseImpl(sl<TimetableRepository>()),
  );
  sl.registerFactory<TimetableLoadDataForTargetUseCase>(
    () => TimetableLoadDataForTargetUseCaseImpl(sl<TimetableRepository>()),
  );
  sl.registerFactory<SuggestionsLoadUseCase>(
    () => SuggestionsLoadUseCaseImpl(sl<SuggestionRepository>()),
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
      timetableLoadDataUseCase: sl<TimetableLoadDataUseCase>(),
      timetableLoadDataForTargetUseCase:
          sl<TimetableLoadDataForTargetUseCase>(),
    ),
  );

  sl.registerFactory<SuggestionsBloc>(
    () => SuggestionsBloc(sl<SuggestionsLoadUseCase>()),
  );
}

void _initWidgets() {
  sl.registerFactory<LoadingIndicator>(() => StandardLoadingIndicator());
}
