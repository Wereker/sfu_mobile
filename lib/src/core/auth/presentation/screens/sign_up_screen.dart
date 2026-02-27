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

enum UserRole { student, teacher }

class _SignUpScreenState extends State<SignUpScreen> {
  late final nameController = TextEditingController();
  late final groupController = TextEditingController();
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final password2Controller = TextEditingController();

  UserRole? _role = UserRole.student;
  String? _group = "-";

  @override
  void dispose() {
    nameController.dispose();
    groupController.dispose();
    emailController.dispose();
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
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
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
                      controller: emailController,
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
                    // TextField(
                    //   controller: groupController,
                    //   decoration: InputDecoration(hintText: 'Группа'),
                    // ),
                    DropdownButtonFormField<String>(
                      initialValue: _group,
                      items: const [
                        DropdownMenuItem(value: '-', child: Text('-')),
                        DropdownMenuItem(value: 'КИ23-05Б (1 подгруппа)', child: Text('КИ23-05Б (1 подгруппа)')),
                        DropdownMenuItem(value: 'КИ25-13Б (1 подгруппа)', child: Text('КИ25-13Б (1 подгруппа)')),
                        DropdownMenuItem(value: 'КИ22-13Б (1 подгруппа)', child: Text('КИ22-13Б (1 подгруппа)')),
                        DropdownMenuItem(value: 'КИ22-07Б (1 подгруппа)', child: Text('КИ22-07Б (1 подгруппа)')),
                      ],
                      onChanged: (String? newValue) {
                        _group = newValue;
                      },
                    ),
                    const SizedBox(height: 24),
                    RadioGroup<UserRole>(
                      groupValue: _role,
                      onChanged: (value) {
                        setState(() {
                          _role = value;
                        });
                      },
                      child: Column(
                        children: [
                          RadioListTile<UserRole>(
                            title: Text("Студент"),
                            value: UserRole.student,
                          ),
                          RadioListTile<UserRole>(
                            title: Text("Преподаватель"),
                            value: UserRole.teacher,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.signUp(
                            email: emailController.text,
                            password1: passwordController.text,
                            password2: password2Controller.text,
                            name: nameController.text,
                            group: _group!,
                            role: _role!.name,
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
