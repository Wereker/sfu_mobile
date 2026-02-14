import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/screens/home_screen.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/auth/presentation/screens/sign_in_screen.dart';
import 'package:sfu/src/core/widgets/splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthorized: () {
            if (ModalRoute.of(context)?.settings.name != '/signIn') {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/signIn',
                (route) => false,
              );
            }
          },
          authorized: () {
            if (ModalRoute.of(context)?.settings.name == '/signIn') {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authorized: () => const HomeScreen(),
            unauthorized: () => const SignInScreen(),
            orElse: () => const SplashScreen(),
          );
        },
      ),
    );
  }
}
