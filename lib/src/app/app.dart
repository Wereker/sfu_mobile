import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sfu/src/app/screens/auth_wrapper.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/auth/presentation/screens/reset_password_screen.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_in_screen.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_up_screen.dart';
import 'package:sfu/src/core/l10n/strings.g.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/widgets/splash_screen.dart';
import 'package:sfu/src/feature/announcements/presentation/bloc/announcements_bloc.dart';
import 'package:sfu/src/feature/events/presentation/bloc/events_bloc.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/screens/profile_screen.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:sfu/src/feature/timetable/data/data_source/remote/timetable_remote_data_source.dart';
import 'package:sfu/src/feature/timetable/presentation/bloc/timetable_bloc.dart';

import 'screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              unauthorized: () => navigatorKey.currentState
                  ?.pushNamedAndRemoveUntil('/signIn', (route) => false),
              authorized: () {
                context.read<ProfileBloc>().add(ProfileEvent.loadData());
                context.read<AnnouncementsBloc>().add(AnnouncementsEvent.load());
                context.read<EventsBloc>().add(EventsEvent.load());
                navigatorKey.currentState
                    ?.pushNamedAndRemoveUntil('/home', (route) => false);
              },
              orElse: () {},
            );
          },
        ),

        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (user) {
                final isTeacher = user.role == UserRole.teacher ||
                    user.role == UserRole.admin;
                final targetId = isTeacher
                    ? user.id
                    : int.tryParse(user.groupId ?? '') ?? 0;
                final type = isTeacher
                    ? TimetableTargetType.teacher
                    : TimetableTargetType.group;
                context.read<TimetableBloc>().add(
                  TimetableEvent.loadData(userId: targetId, userType: type),
                );
              },
              orElse: () {},
            );
          },
        ),

        // При смене языка в настройках — применяем локаль в slang
        BlocListener<SettingsBloc, SettingsState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (settings) {
                LocaleSettings.setLocale(_appLocaleFromCode(settings.locale));
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final themeMode = state.maybeWhen(
            success: (settings) => _parseThemeMode(settings.themeMode),
            orElse: () => ThemeMode.system,
          );

          // locale берём напрямую из LocaleSettings — без TranslationProvider
          final locale = LocaleSettings.currentLocale.flutterLocale;

          return MaterialApp(
            navigatorKey: App.navigatorKey,
            locale: locale,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocaleUtils.supportedLocales,
            debugShowCheckedModeBanner: false,
            routes: _routes(),
            home: state.maybeWhen(
              success: (_) => const AuthWrapper(),
              error: (msg) => _ErrorScreen(message: msg),
              orElse: () => const SplashScreen(),
            ),
          );
        },
      ),
    );
  }

  AppLocale _appLocaleFromCode(String code) => switch (code) {
    'en' => AppLocale.en,
    _ => AppLocale.ru,
  };

  ThemeMode _parseThemeMode(String mode) => switch (mode) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  Map<String, WidgetBuilder> _routes() => {
    '/signIn': (_) => const SignInScreen(),
    '/signUp': (_) => const SignUpScreen(),
    '/resetPassword': (_) => const ResetPasswordScreen(),
    '/home': (_) => const HomeScreen(),
    '/profile': (_) => const ProfileScreen(),
  };
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Ошибка: $message', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context
                  .read<SettingsBloc>()
                  .add(SettingsEvent.getAppSettings()),
              child: Text(t.common.retry),
            ),
          ],
        ),
      ),
    );
  }
}