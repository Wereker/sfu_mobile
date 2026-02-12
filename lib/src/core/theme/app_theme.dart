import 'package:flutter/material.dart';

class AppTheme {
  static const primaryLight = Color(0xFFFF9900);
  static const primaryDark = Color(0xFFFFFFFF);

  static const primaryBtn = Color(0xFFFF9900);
  static const secondaryBtn = Color(0x00FF9900);

  static final light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryLight,
      onPrimary: Colors.white,
      secondary: Colors.grey,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryLight, width: 2.0),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: primaryBtn,
        foregroundColor: Color(0xFFFFFFFF),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: secondaryBtn,
        splashFactory: NoSplash.splashFactory,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryLight,
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
          return const TextStyle(color: primaryLight, fontSize: 12);
        }
        return const TextStyle(color: Colors.black, fontSize: 12);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: primaryLight, size: 24);
        }
        return const IconThemeData(color: Colors.black, size: 24);
      }),
    ),

    iconTheme: IconThemeData(
      color: primaryLight,
    ),
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: primaryDark,
      onPrimary: Colors.black,
      secondary: Colors.grey,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryDark, width: 2.0),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: primaryBtn,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: secondaryBtn,
        foregroundColor: Color(0xFFFF9900),
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
          return const TextStyle(color: primaryLight, fontSize: 12);
        }
        return const TextStyle(color: Colors.white, fontSize: 12);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: primaryLight, size: 24);
        }
        return const IconThemeData(color: Colors.white, size: 24);
      }),
    ),

    iconTheme: IconThemeData(
      color: primaryDark,
    ),
  );
}
