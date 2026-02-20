import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/widgets/custom_app_bar.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart' as di;
import 'package:sfu/src/core/widgets/splash_screen.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_body_widget.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return state.maybeWhen(
          loading: () => SplashScreen(),
          orElse: () => BlocProvider<ProfileBloc>(
            create: (context) => di.sl<ProfileBloc>()..add(ProfileEvent.loadData()),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => SplashScreen(),
                  success: (user) => Scaffold(
                    appBar: CustomAppBar(),
                    body: ProfileBodyWidget(user),
                    bottomNavigationBar: ProfileBottomNavBar(),
                  ),
                  orElse: () => Scaffold(),
                );
              },
            ),
          ),
        );
      },
      listener: (BuildContext context, AuthState state) {
        state.maybeWhen(
          authorized: () => Navigator.pushReplacementNamed(context, '/home'),
          unauthorized: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/signIn',
                  (Route<dynamic> route) => false,
            );
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () => {},
        );
      },
    );
  }
}
