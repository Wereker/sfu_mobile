import 'package:flutter/material.dart';
import 'app_theme.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppTheme.primaryLight,
      onPrimary: Colors.white,
      secondary: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.primaryLight, width: 2.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppTheme.primaryBtn,
        foregroundColor: const Color(0xFFFFFFFF),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppTheme.secondaryBtn,
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppTheme.primaryLight,
      contentTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(color: AppTheme.primaryLight, fontSize: 12);
        }
        return const TextStyle(color: Colors.black, fontSize: 12);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppTheme.primaryLight, size: 24);
        }
        return const IconThemeData(color: Colors.black, size: 24);
      }),
    ),
    iconTheme: const IconThemeData(color: AppTheme.primaryLight),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppTheme.primaryLight, width: 1),
      ),
    ),
    appBarTheme: AppBarThemeData(
      iconTheme: IconThemeData(
        color: AppTheme.primaryLight
      )
    ),
  );
}