import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController loginController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
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
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 100),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: loginController,
                    decoration: InputDecoration(hintText: t?.loginHint),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: passwordController,
                    autofillHints: const [AutofillHints.password],
                    obscureText: true,
                    decoration: InputDecoration(hintText: t?.passwordHint),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthEvent.signIn(
                          login: loginController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) => state.maybeWhen(
                        loading: () => CircularProgressIndicator(),
                        orElse: () => Text(t!.signInButton),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(t!.signUpButton),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/resetPassword');
                    },
                    child: Text(t!.forgotPassword),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
