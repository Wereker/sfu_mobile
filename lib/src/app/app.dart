import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/screens/auth_wrapper.dart';
import 'package:sfu/src/app/screens/home_screen.dart';
import 'package:sfu/src/feature/chat/message/presentation/screens/message_screen.dart';
import 'package:sfu/src/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/core/auth/presentation/screens/reset_password_screen.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_in_screen.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_up_screen.dart';
import 'package:sfu/src/core/widgets/splash_screen.dart';
import 'package:sfu/src/feature/profile/presentation/screens/profile_screen.dart';
import 'package:sfu/src/feature/settings/presentation/screen/settings_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final locale = state.maybeWhen(
          success: (settings) => _getLocaleFromCode(settings.locale),
          orElse: () => const Locale('ru'),
        );

        final themeMode = state.maybeWhen(
          success: (settings) => _parseThemeMode(settings.themeMode),
          orElse: () => ThemeMode.system,
        );

        return MaterialApp(
          locale: locale,
          localeResolutionCallback: (locale, supportedLocales) => locale,

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,

          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          debugShowCheckedModeBanner: false,
          routes: _buildRoutes(),

          home: state.maybeWhen(
            success: (settings) => const AuthWrapper(),
            error: (message) => _ErrorScreen(message: message),
            orElse: () => const SplashScreen(),
          ),
        );
      },
    );
  }

  Locale _getLocaleFromCode(String localeCode) {
    final parts = localeCode.split('_');
    return parts.length > 1
        ? Locale(parts[0], parts[1])
        : Locale(localeCode);
  }

  ThemeMode _parseThemeMode(String themeMode) {
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  Map<String, Widget Function(BuildContext)> _buildRoutes() {
    return {
      '/signIn': (context) => const SignInScreen(),
      '/signUp': (context) => const SignUpScreen(),
      '/resetPassword': (context) => const ResetPasswordScreen(),
      '/home': (context) => const HomeScreen(),
      '/profile': (context) => const ProfileScreen(),
    };
  }
}

class _ErrorScreen extends StatelessWidget {
  final String message;

  const _ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('${t?.appError}: $message', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<SettingsBloc>().add(
                SettingsEvent.getAppSettings(),
              ),
              child: Text(t!.appError),
            ),
          ],
        ),
      ),
    );
  }
}