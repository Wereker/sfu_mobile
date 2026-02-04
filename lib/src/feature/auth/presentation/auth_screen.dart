import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfu/l10n/app_localizations.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

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
              spacing: 24.0,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(decoration: InputDecoration(hintText: t?.loginHint)),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: t?.passwordHint),
                ),
                ElevatedButton(onPressed: () {}, child: Text(t!.signInButton)),
                OutlinedButton(onPressed: () {}, child: Text(t!.forgotPassword)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
