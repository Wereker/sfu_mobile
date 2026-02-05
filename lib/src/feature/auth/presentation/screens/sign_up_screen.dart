import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/feature/auth/presentation/bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final nameController = TextEditingController();
    final surnameController = TextEditingController();
    final loginController = TextEditingController();
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
                      controller: nameController,
                      decoration: InputDecoration(hintText: t?.nameHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: surnameController,
                      decoration: InputDecoration(hintText: t?.surnameHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: loginController,
                      decoration: InputDecoration(hintText: t?.loginHint),
                    ),
                    const SizedBox(height: 24),
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
                          AuthEvent.signUp(
                            login: loginController.text,
                            password1: passwordController.text,
                            password2: password2Controller.text,
                            firstName: nameController.text,
                            lastName: surnameController.text,
                          ),
                        );
                      },
                      child: state.maybeWhen(
                        loading: () => CircularProgressIndicator(),
                        orElse: () => Text(t!.signUpButton),
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
