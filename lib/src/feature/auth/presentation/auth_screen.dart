import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                TextField(decoration: InputDecoration(hintText: "Логин")),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Пароль"),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Войти")),
                OutlinedButton(onPressed: () {}, child: Text("Забыли пароль?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
