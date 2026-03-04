import 'package:flutter/material.dart';

@immutable
class AppSettings {
  final String locale;
  final String themeMode;

  const AppSettings({required this.locale, required this.themeMode});
}