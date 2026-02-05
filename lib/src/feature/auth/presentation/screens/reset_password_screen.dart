import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/feature/auth/presentation/bloc/auth_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final passwordController = TextEditingController();
    final password2Controller = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authorized: () => Navigator.pushReplacementNamed(context, '/home'),
            unauthorized: () =>
                Navigator.pushReplacementNamed(context, '/signIn'),
            error: (message) => {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message))),
            },
            orElse: () => {},
          );
        },
        builder: (context, state) {
          return Scaffold(
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: t?.passwordHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: password2Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: t?.passwordRepeatHint,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.resetPassword(
                            newPassword: passwordController.text,
                          ),
                        );
                      },
                      child: state.maybeWhen(
                        loading: () => CircularProgressIndicator(),
                        orElse: () => Text(t!.resetPasswordButton),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
