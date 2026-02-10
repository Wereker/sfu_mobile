import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/screens/home_screen.dart';
import 'package:sfu/src/core/theme/app_theme.dart';
import 'package:sfu/src/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/feature/auth/presentation/screens/reset_password_screen.dart';
import 'package:sfu/src/feature/auth/presentation/screens/sign_in_screen.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:sfu/src/feature/profile/presentation/screens/profile_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final routes = {
      '/signIn': (context) => const SignInScreen(),
      '/signUp': (context) => const SignUpScreen(),
      '/resetPassword': (context) => const ResetPasswordScreen(),
      '/home': (context) => const HomeScreen(),
      '/profile': (context) => const ProfileScreen(),
    };

    return MaterialApp(
      title: t?.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          state.maybeWhen(
            authorized: () => Navigator.pushReplacementNamed(context, '/home'),
            unauthorized: () =>
                Navigator.pushReplacementNamed(context, '/signIn'),
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () => {},
          );
        },
        child: const HomeScreen(),
      ),
    );
  }
}
