import 'package:flutter/material.dart';

import 'app_theme_light.dart';
import 'app_theme_dark.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFFFF9900);
  static const Color primaryDark = Color(0xFFFFFFFF);
  static const Color primaryBtn = Color(0xFFFF9900);
  static const Color secondaryBtn = Color(0x00FF9900);

  static final ThemeData light = LightTheme.theme;
  static final ThemeData dark = DarkTheme.theme;
}
