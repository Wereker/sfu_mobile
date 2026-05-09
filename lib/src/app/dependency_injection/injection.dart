import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:sfu/src/core/auth/data/data_sources/remote/auth_remote_data_source_mock.dart';
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

import 'package:sfu/src/core/utils/loading_indicator/loading_indicator.dart';
import 'package:sfu/src/core/utils/loading_indicator/standard_loading_indicator.dart';

import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source.dart';
import 'package:sfu/src/feature/announcements/data/data_source/remote/announcements_remote_data_source_mock.dart';
import 'package:sfu/src/feature/announcements/data/repository/announcements_repository_mock.dart';
import 'package:sfu/src/feature/announcements/domain/repository/announcements_repository.dart';
import 'package:sfu/src/feature/announcements/domain/use_case/get_announcements_use_case.dart';
import 'package:sfu/src/feature/announcements/domain/use_case/get_announcements_use_case_impl.dart';

import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source.dart';
import 'package:sfu/src/feature/attendance/data/data_source/remote/attendance_remote_data_source_mock.dart';
import 'package:sfu/src/feature/attendance/data/repository/attendance_repository_mock.dart';
import 'package:sfu/src/feature/attendance/domain/entity/attendance_student.dart';
import 'package:sfu/src/feature/attendance/domain/repository/attendance_repository.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/close_attendance_session_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/close_attendance_session_use_case_impl.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/create_attendance_session_use_case_impl.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_attendance_history_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_attendance_history_use_case_impl.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_session_students_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/get_session_students_use_case_impl.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/mark_attendance_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/mark_attendance_use_case_impl.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case.dart';
import 'package:sfu/src/feature/attendance/domain/use_case/update_student_status_use_case_impl.dart';

import 'package:sfu/src/feature/chat/data/data_source/local/chat_locale_data_source.dart';
import 'package:sfu/src/feature/chat/data/data_source/local/chat_locale_data_source_mock.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source.dart';
import 'package:sfu/src/feature/chat/data/data_source/remote/chat_remote_data_source_mock.dart';
import 'package:sfu/src/feature/chat/data/repository/chat_repository_mock.dart';
import 'package:sfu/src/feature/chat/domain/repository/chat_repository.dart';
import 'package:sfu/src/feature/chat/domain/use_case/get_chats_use_case.dart';
import 'package:sfu/src/feature/chat/domain/use_case/get_chats_use_case_impl.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source.dart';
import 'package:sfu/src/feature/chat/message/data/data_source/remote/message_remote_data_source_mock.dart';
import 'package:sfu/src/feature/chat/message/data/repository/message_repository_mock.dart';
import 'package:sfu/src/feature/chat/message/domain/repository/message_repository.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case.dart';
import 'package:sfu/src/feature/chat/message/domain/use_case/get_messages_use_case_impl.dart';

import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source.dart';
import 'package:sfu/src/feature/department/data/data_source/remote/department_remote_data_source_mock.dart';
import 'package:sfu/src/feature/department/data/repository/department_repository_mock.dart';
import 'package:sfu/src/feature/department/domain/repository/department_repository.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_member_use_case.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_member_use_case_impl.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_use_case.dart';
import 'package:sfu/src/feature/department/domain/use_case/get_staff_use_case_impl.dart';

import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source.dart';
import 'package:sfu/src/feature/events/data/data_source/remote/events_remote_data_source_mock.dart';
import 'package:sfu/src/feature/events/data/repository/events_repository_mock.dart';
import 'package:sfu/src/feature/events/domain/repository/events_repository.dart';
import 'package:sfu/src/feature/events/domain/use_case/enroll_event_use_case.dart';
import 'package:sfu/src/feature/events/domain/use_case/enroll_event_use_case_impl.dart';
import 'package:sfu/src/feature/events/domain/use_case/get_events_use_case.dart';
import 'package:sfu/src/feature/events/domain/use_case/get_events_use_case_impl.dart';
import 'package:sfu/src/feature/events/domain/use_case/unenroll_event_use_case.dart';
import 'package:sfu/src/feature/events/domain/use_case/unenroll_event_use_case_impl.dart';

import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source.dart';
import 'package:sfu/src/feature/management/data/data_source/remote/management_remote_data_source_mock.dart';
import 'package:sfu/src/feature/management/data/repository/management_repository_mock.dart';
import 'package:sfu/src/feature/management/domain/repository/management_repository.dart';
import 'package:sfu/src/feature/management/domain/use_case/create_thesis_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/create_thesis_use_case_impl.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_my_theses_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_my_theses_use_case_impl.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_students_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/get_students_use_case_impl.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_announcement_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_announcement_use_case_impl.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_event_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/publish_event_use_case_impl.dart';
import 'package:sfu/src/feature/management/domain/use_case/update_thesis_use_case.dart';
import 'package:sfu/src/feature/management/domain/use_case/update_thesis_use_case_impl.dart';

import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:sfu/src/feature/profile/data/data_source/remote/profile_remote_data_source_mock.dart';
import 'package:sfu/src/feature/profile/data/repository/profile_repositroy_mock.dart';
import 'package:sfu/src/feature/profile/domain/repository/profile_repository.dart';
import 'package:sfu/src/feature/profile/domain/use_case/get_profile_use_case.dart';
import 'package:sfu/src/feature/profile/domain/use_case/get_profile_use_case_impl.dart';

import 'package:sfu/src/feature/settings/data/data_source/local/settings_local_data_source.dart';
import 'package:sfu/src/feature/settings/data/data_source/local/settings_local_data_source_impl.dart';
import 'package:sfu/src/feature/settings/data/repository/settings_repository_impl.dart';
import 'package:sfu/src/feature/settings/domain/repository/settings_repository.dart';
import 'package:sfu/src/feature/settings/domain/use_case/get_app_settings_use_case.dart';
import 'package:sfu/src/feature/settings/domain/use_case/get_app_settings_use_case_impl.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_localization_use_case.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_localization_use_case_impl.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_theme_mode_use_case.dart';
import 'package:sfu/src/feature/settings/domain/use_case/update_app_theme_mode_use_case_impl.dart';

import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/local/timetable_local_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/data/repository/timetable_repository_mock.dart';
import 'package:sfu/src/feature/timetable/domain/repository/timetable_repository.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case.dart';
import 'package:sfu/src/feature/timetable/domain/use_case/get_timetable_use_case_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/data_source/remote/suggestion_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/data_source/remote/suggestion_remote_data_source_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/data/repository/suggestion_repository_impl.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/repository/suggestion_repository.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/get_suggestions_use_case.dart';
import 'package:sfu/src/feature/timetable/suggestion/domain/use_case/get_suggestions_use_case_impl.dart';

import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/feature/chat/message/presentation/bloc/message_bloc.dart';
import 'package:sfu/src/feature/chat/presentation/bloc/chat_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:sfu/src/feature/timetable/suggestion/presentation/bloc/suggestions_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs        = await SharedPreferences.getInstance();
  final secureStorage = const FlutterSecureStorage();

  _initLocalStorage(prefs, secureStorage);
  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBloc();
  _initWidgets();
}


// Local storage
void _initLocalStorage(SharedPreferences prefs, FlutterSecureStorage storage) {
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerSingleton<FlutterSecureStorage>(storage);
}


// Data sources
void _initDataSources() {
  // Auth
  sl.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(
      sl<FlutterSecureStorage>(),
      sl<SharedPreferences>(),
    ),
  );
  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceMock(),
  );

  // Settings
  sl.registerSingleton<SettingsLocalDataSource>(
    SettingsLocalDataSourceImpl(sl<SharedPreferences>()),
  );

  // Timetable
  sl.registerSingleton<TimetableRemoteDataSource>(
    TimetableRemoteDataSourceImpl(),
  );
  sl.registerSingleton<TimetableLocalDataSource>(
    TimetableLocalDataSourceImpl(),
  );
  sl.registerSingleton<SuggestionRemoteDataSource>(
    SuggestionRemoteDataSourceImpl(),
  );

  // Chat
  sl.registerSingleton<ChatRemoteDataSource>(ChatRemoteDataSourceMock());
  sl.registerSingleton<ChatLocaleDataSource>(ChatLocaleDataSourceMock());
  sl.registerSingleton<MessageRemoteDataSource>(MessageRemoteDataSourceMock());

  // Profile
  sl.registerSingleton<ProfileRemoteDataSource>(
    ProfileRemoteDataSourceMock(),
  );

  // Announcements
  sl.registerSingleton<AnnouncementsRemoteDataSource>(
    AnnouncementsRemoteDataSourceMock(),
  );

  // Events
  sl.registerSingleton<EventsRemoteDataSource>(EventsRemoteDataSourceMock());

  // Department
  sl.registerSingleton<DepartmentRemoteDataSource>(
    DepartmentRemoteDataSourceMock(),
  );

  // Management
  sl.registerSingleton<ManagementRemoteDataSource>(
    ManagementRemoteDataSourceMock(),
  );

  // Attendance
  sl.registerSingleton<AttendanceRemoteDataSource>(
    AttendanceRemoteDataSourceMock(),
  );
}

// Repositories
void _initRepositories() {
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryMock(),
  );

  sl.registerSingleton<ProfileRepository>(
    ProfileRepositoryMock(sl<ProfileRemoteDataSource>()),
  );

  sl.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(sl<SettingsLocalDataSource>()),
  );

  sl.registerSingleton<TimetableRepository>(
    TimetableRepositoryMock(remote: sl<TimetableRemoteDataSource>()),
  );

  sl.registerSingleton<SuggestionRepository>(
    SuggestionRepositoryImpl(remote: sl<SuggestionRemoteDataSource>()),
  );

  sl.registerSingleton<ChatRepository>(
    ChatRepositoryMock(
      sl<ChatRemoteDataSource>(),
      sl<ChatLocaleDataSource>(),
    ),
  );

  sl.registerSingleton<MessageRepository>(
    MessageRepositoryMock(sl<MessageRemoteDataSource>()),
  );

  sl.registerSingleton<AnnouncementsRepository>(
    AnnouncementsRepositoryMock(sl<AnnouncementsRemoteDataSource>()),
  );

  sl.registerSingleton<EventsRepository>(
    EventsRepositoryMock(sl<EventsRemoteDataSource>()),
  );

  sl.registerSingleton<DepartmentRepository>(
    DepartmentRepositoryMock(sl<DepartmentRemoteDataSource>()),
  );

  sl.registerSingleton<ManagementRepository>(
    ManagementRepositoryMock(sl<ManagementRemoteDataSource>()),
  );

  sl.registerSingleton<AttendanceRepository>(
    AttendanceRepositoryMock(sl<AttendanceRemoteDataSource>()),
  );
}

// Use cases
void _initUseCases() {
  // Auth
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

  // Profile
  sl.registerFactory<GetProfileUseCase>(
        () => GetProfileUseCaseImpl(sl<ProfileRepository>()),
  );

  // Settings
  sl.registerFactory<GetAppSettingsUseCase>(
        () => GetAppSettingsUseCaseImpl(sl<SettingsRepository>()),
  );
  sl.registerFactory<UpdateAppLocalizationUseCase>(
        () => UpdateAppLocalizationUseCaseImpl(sl<SettingsRepository>()),
  );
  sl.registerFactory<UpdateAppThemeModeUseCase>(
        () => UpdateAppThemeModeUseCaseImpl(sl<SettingsRepository>()),
  );

  // Timetable
  sl.registerFactory<GetTimetableUseCase>(
        () => GetTimetableUseCaseImpl(sl<TimetableRepository>()),
  );
  sl.registerFactory<GetSuggestionsUseCase>(
        () => GetSuggestionsUseCaseImpl(sl<SuggestionRepository>()),
  );

  // Chat
  sl.registerFactory<GetChatsUseCase>(
        () => GetChatsUseCaseImpl(sl<ChatRepository>()),
  );
  sl.registerFactory<GetMessagesUseCase>(
        () => GetMessagesUseCaseImpl(sl<MessageRepository>()),
  );

  // Announcements
  sl.registerFactory<GetAnnouncementsUseCase>(
        () => GetAnnouncementsUseCaseImpl(sl<AnnouncementsRepository>()),
  );

  // Events
  sl.registerFactory<GetEventsUseCase>(
        () => GetEventsUseCaseImpl(sl<EventsRepository>()),
  );
  sl.registerFactory<EnrollEventUseCase>(
        () => EnrollEventUseCaseImpl(sl<EventsRepository>()),
  );
  sl.registerFactory<UnenrollEventUseCase>(
        () => UnenrollEventUseCaseImpl(sl<EventsRepository>()),
  );

  // Department
  sl.registerFactory<GetStaffUseCase>(
        () => GetStaffUseCaseImpl(sl<DepartmentRepository>()),
  );
  sl.registerFactory<GetStaffMemberUseCase>(
        () => GetStaffMemberUseCaseImpl(sl<DepartmentRepository>()),
  );

  // Management
  sl.registerFactory<GetStudentsUseCase>(
        () => GetStudentsUseCaseImpl(sl<ManagementRepository>()),
  );
  sl.registerFactory<GetMyThesesUseCase>(
        () => GetMyThesesUseCaseImpl(sl<ManagementRepository>()),
  );
  sl.registerFactory<CreateThesisUseCase>(
        () => CreateThesisUseCaseImpl(sl<ManagementRepository>()),
  );
  sl.registerFactory<UpdateThesisUseCase>(
        () => UpdateThesisUseCaseImpl(sl<ManagementRepository>()),
  );
  sl.registerFactory<PublishAnnouncementUseCase>(
        () => PublishAnnouncementUseCaseImpl(sl<ManagementRepository>()),
  );
  sl.registerFactory<PublishEventUseCase>(
        () => PublishEventUseCaseImpl(sl<ManagementRepository>()),
  );

  // Attendance
  sl.registerFactory<CreateAttendanceSessionUseCase>(
        () => CreateAttendanceSessionUseCaseImpl(sl<AttendanceRepository>()),
  );
  sl.registerFactory<CloseAttendanceSessionUseCase>(
        () => CloseAttendanceSessionUseCaseImpl(sl<AttendanceRepository>()),
  );
  sl.registerFactory<GetSessionStudentsUseCase>(
        () => GetSessionStudentsUseCaseImpl(sl<AttendanceRepository>()),
  );
  sl.registerFactory<UpdateStudentStatusUseCase>(
        () => UpdateStudentStatusUseCaseImpl(sl<AttendanceRepository>()),
  );
  sl.registerFactory<MarkAttendanceUseCase>(
        () => MarkAttendanceUseCaseImpl(sl<AttendanceRepository>()),
  );
  sl.registerFactory<GetAttendanceHistoryUseCase>(
        () => GetAttendanceHistoryUseCaseImpl(sl<AttendanceRepository>()),
  );
}

// BLoC
void _initBloc() {
  sl.registerFactory<AuthBloc>(
        () => AuthBloc(
      signInUseCase:         sl<SignInUseCase>(),
      signUpUseCase:         sl<SignUpUseCase>(),
      logoutUseCase:         sl<LogoutUseCase>(),
      resetPasswordUseCase:  sl<ResetPasswordUseCase>(),
      checkAuthStatusUseCase: sl<CheckAuthStatusUseCase>(),
    ),
  );

  sl.registerFactory<ProfileBloc>(
        () => ProfileBloc(sl<GetProfileUseCase>()),
  );

  sl.registerFactory<SettingsBloc>(
        () => SettingsBloc(
      getAppSettingsUseCase:       sl<GetAppSettingsUseCase>(),
      updateAppThemeModeUseCase:   sl<UpdateAppThemeModeUseCase>(),
      updateAppLocalizationUseCase: sl<UpdateAppLocalizationUseCase>(),
    ),
  );

  sl.registerFactory<TimetableBloc>(
        () => TimetableBloc(
            getTimetableUseCase: sl<GetTimetableUseCase>()
        ),
  );

  sl.registerFactory<SuggestionsBloc>(
        () => SuggestionsBloc(sl<GetSuggestionsUseCase>()),
  );

  sl.registerFactory<ChatBloc>(
        () => ChatBloc(sl<GetChatsUseCase>()),
  );

  sl.registerFactory<MessageBloc>(
        () => MessageBloc(sl<GetMessagesUseCase>()),
  );
}


// Widgets
void _initWidgets() {
  sl.registerFactory<LoadingIndicator>(() => StandardLoadingIndicator());
}