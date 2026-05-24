import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_in_screen.dart';
import 'package:sfu/src/core/widgets/splash_screen.dart';

import 'home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeWhen(
        authorized: () => const HomeScreen(),
        unauthorized: () => const SignInScreen(),
        orElse: () => const SplashScreen(),
      ),
    );
  }
}