import 'package:flutter/material.dart';
import 'app_theme.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppTheme.primaryDark,
      onPrimary: Colors.black,
      secondary: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.primaryDark, width: 2.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppTheme.primaryBtn,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: AppTheme.secondaryBtn,
        foregroundColor: const Color(0xFFFF9900),
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFFFF9900),
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
        return const TextStyle(color: Colors.white, fontSize: 12);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppTheme.primaryLight, size: 24);
        }
        return const IconThemeData(color: Colors.white, size: 24);
      }),
    ),
    iconTheme: const IconThemeData(color: AppTheme.primaryDark),
    cardTheme: CardThemeData(
      color: Colors.grey.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.transparent, width: 1),
      ),
    ),
    cardColor: Colors.grey[900],
  );
}