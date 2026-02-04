import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/l10n/app_localizations.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
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
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(t!.signInButton),
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
    );
  }
}
