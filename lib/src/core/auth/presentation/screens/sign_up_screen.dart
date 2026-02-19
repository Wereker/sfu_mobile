import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';
import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/widgets/loading_indicator_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final nameController = TextEditingController();
  late final roleController = TextEditingController();
  late final groupController = TextEditingController();
  late final loginController = TextEditingController();
  late final passwordController = TextEditingController();
  late final password2Controller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    groupController.dispose();
    loginController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            unauthorized: () => Navigator.pop(context),
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
                      decoration: InputDecoration(hintText: t?.authNameHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: loginController,
                      decoration: InputDecoration(hintText: t?.authLoginHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: t?.authPasswordHint),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: password2Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: t?.authPasswordRepeatHint,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: groupController,
                      decoration: InputDecoration(hintText: 'Группа'),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: roleController,
                      decoration: InputDecoration(hintText: 'Роль'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.signUp(
                            login: loginController.text,
                            password1: passwordController.text,
                            password2: password2Controller.text,
                            name: nameController.text,
                            group: groupController.text,
                            role: roleController.text,
                          ),
                        );
                      },
                      child: state.maybeWhen(
                        loading: () => LoadingIndicatorWidget(),
                        orElse: () => Text(t!.authSignUpButton),
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
