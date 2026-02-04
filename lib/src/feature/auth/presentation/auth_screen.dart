import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24.0,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
            ),
            const SizedBox(height: 50),
            TextField(decoration: InputDecoration(labelText: "Логин")),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Пароль"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Войти")),
            OutlinedButton(onPressed: () {}, child: Text("Забыли пароль?")),
          ],
        ),
      ),
    );
  }
}
