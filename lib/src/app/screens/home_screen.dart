import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/widgets/app_navigation_bar.dart';
import 'package:sfu/src/app/widgets/custom_app_bar.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/widgets/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Scaffold(body: const Center(child: Text("Список новостей"))),
    Scaffold(body: const Center(child: Text("Расписание занятий"))),
    Scaffold(body: const Center(child: Text("Чат"))),
    Scaffold(body: const Center(child: Text("Календарь"))),
    Scaffold(body: const Center(child: Text("Домашняя"))),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return state.maybeWhen(
          loading: () => SplashScreen(),
          orElse: () => Scaffold(
            appBar: CustomAppBar(),
            body: IndexedStack(index: currentIndex, children: screens),
            bottomNavigationBar: AppNavigationBar(
              currentIndex: currentIndex,
              onDestinationSelected: (index) {
                setState(() => currentIndex = index);
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
