import 'package:flutter/material.dart';

/// Цвета из дизайн-системы, которых нет в стандартном ColorScheme
/// (surfaceTinted, semantic, текстовые градации). Доступ через
/// `Theme.of(context).extension<AppColors>()!`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  // Surfaces
  final Color surfaceTinted;
  final Color surfaceHover;
  final Color textOnTinted;

  // Текстовые градации
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  // Линии
  final Color border;
  final Color borderStrong;
  final Color divider;

  // Brand
  final Color primaryHover;
  final Color primaryPressed;

  // Semantic
  final Color success;
  final Color successBg;
  final Color successFg;
  final Color warning;
  final Color warningBg;
  final Color warningFg;
  final Color error;
  final Color errorBg;
  final Color errorFg;
  final Color info;
  final Color infoBg;
  final Color infoFg;

  const AppColors({
    required this.surfaceTinted,
    required this.surfaceHover,
    required this.textOnTinted,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.border,
    required this.borderStrong,
    required this.divider,
    required this.primaryHover,
    required this.primaryPressed,
    required this.success,
    required this.successBg,
    required this.successFg,
    required this.warning,
    required this.warningBg,
    required this.warningFg,
    required this.error,
    required this.errorBg,
    required this.errorFg,
    required this.info,
    required this.infoBg,
    required this.infoFg,
  });

  @override
  AppColors copyWith({
    Color? surfaceTinted,
    Color? surfaceHover,
    Color? textOnTinted,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? border,
    Color? borderStrong,
    Color? divider,
    Color? primaryHover,
    Color? primaryPressed,
    Color? success,
    Color? successBg,
    Color? successFg,
    Color? warning,
    Color? warningBg,
    Color? warningFg,
    Color? error,
    Color? errorBg,
    Color? errorFg,
    Color? info,
    Color? infoBg,
    Color? infoFg,
  }) {
    return AppColors(
      surfaceTinted: surfaceTinted ?? this.surfaceTinted,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      textOnTinted: textOnTinted ?? this.textOnTinted,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      divider: divider ?? this.divider,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      successFg: successFg ?? this.successFg,
      warning: warning ?? this.warning,
      warningBg: warningBg ?? this.warningBg,
      warningFg: warningFg ?? this.warningFg,
      error: error ?? this.error,
      errorBg: errorBg ?? this.errorBg,
      errorFg: errorFg ?? this.errorFg,
      info: info ?? this.info,
      infoBg: infoBg ?? this.infoBg,
      infoFg: infoFg ?? this.infoFg,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surfaceTinted: Color.lerp(surfaceTinted, other.surfaceTinted, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      textOnTinted: Color.lerp(textOnTinted, other.textOnTinted, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      success: Color.lerp(success, other.success, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
      successFg: Color.lerp(successFg, other.successFg, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      warningFg: Color.lerp(warningFg, other.warningFg, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      errorFg: Color.lerp(errorFg, other.errorFg, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoBg: Color.lerp(infoBg, other.infoBg, t)!,
      infoFg: Color.lerp(infoFg, other.infoFg, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  // Брендовые константы (одинаковые в обеих темах)
  static const Color primary = Color(0xFFFF9900);
  static const Color secondary = Color(0xFFFFB84D);

  // Радиусы — только три размера + full
  static const double radiusSm = 8;   // status badges
  static const double radiusMd = 12;  // buttons, chips, inputs
  static const double radiusLg = 16;  // cards, sheets

  // Палитры для каждой темы
  static const _light = _Palette(
    bg: Color(0xFFF6F5FB),
    surface: Color(0xFFFFFFFF),
    surfaceTinted: Color(0xFFFFF3E0),
    surfaceHover: Color(0xFFFAF7F1),
    onPrimary: Color(0xFFFFFFFF),
    primaryHover: Color(0xFFE68A00),
    primaryPressed: Color(0xFFCC7A00),
    textPrimary: Color(0xFF1C1B1F),
    textSecondary: Color(0xFF6B7280),
    textTertiary: Color(0xFF9CA3AF),
    textOnTinted: Color(0xFFB36B00),
    border: Color(0xFFE5E7EB),
    borderStrong: Color(0xFFD1D5DB),
    divider: Color(0xFFF0EFF4),
    success: Color(0xFF10B981),
    successBg: Color(0x1A10B981), // 10% alpha
    successFg: Color(0xFF047857),
    warning: Color(0xFFF59E0B),
    warningBg: Color(0x1FF59E0B), // 12% alpha
    warningFg: Color(0xFFB45309),
    error: Color(0xFFEF4444),
    errorBg: Color(0x1AEF4444),
    errorFg: Color(0xFFB91C1C),
    info: Color(0xFFFF9900),
    infoBg: Color(0x1AFF9900),
    infoFg: Color(0xFFB45309),
    brightness: Brightness.light,
  );

  static const _dark = _Palette(
    bg: Color(0xFF0F0E17),
    surface: Color(0xFF1C1B2E),
    surfaceTinted: Color(0xFF4A2E0A),
    surfaceHover: Color(0xFF232140),
    onPrimary: Color(0xFF1C1B2E),
    primaryHover: Color(0xFFFFAD33),
    primaryPressed: Color(0xFFCC7A00),
    textPrimary: Color(0xFFF4F3FF),
    textSecondary: Color(0xFF9CA3AF),
    textTertiary: Color(0xFF6B7280),
    textOnTinted: Color(0xFFFFB84D),
    border: Color(0xFF2D2B4E),
    borderStrong: Color(0xFF3F3D6B),
    divider: Color(0xFF232140),
    success: Color(0xFF34D399),
    successBg: Color(0x2434D399), // 14% alpha
    successFg: Color(0xFF6EE7B7),
    warning: Color(0xFFFBBF24),
    warningBg: Color(0x24FBBF24),
    warningFg: Color(0xFFFCD34D),
    error: Color(0xFFF87171),
    errorBg: Color(0x24F87171),
    errorFg: Color(0xFFFCA5A5),
    info: Color(0xFFFF9900),
    infoBg: Color(0x24FF9900),
    infoFg: Color(0xFFFCD34D),
    brightness: Brightness.dark,
  );

  static final ThemeData light = _build(_light);
  static final ThemeData dark = _build(_dark);

  // ----------------------------------------------------------
  // Сборка темы из палитры. Вся форма виджетов — в одном месте.
  // ----------------------------------------------------------
  static ThemeData _build(_Palette p) {
    final colorScheme = ColorScheme(
      brightness: p.brightness,
      primary: primary,
      onPrimary: p.onPrimary,
      secondary: secondary,
      onSecondary: p.onPrimary,
      surface: p.surface,
      onSurface: p.textPrimary,
      error: p.error,
      onError: Colors.white,
    );

    final appColors = AppColors(
      surfaceTinted: p.surfaceTinted,
      surfaceHover: p.surfaceHover,
      textOnTinted: p.textOnTinted,
      textPrimary: p.textPrimary,
      textSecondary: p.textSecondary,
      textTertiary: p.textTertiary,
      border: p.border,
      borderStrong: p.borderStrong,
      divider: p.divider,
      primaryHover: p.primaryHover,
      primaryPressed: p.primaryPressed,
      success: p.success,
      successBg: p.successBg,
      successFg: p.successFg,
      warning: p.warning,
      warningBg: p.warningBg,
      warningFg: p.warningFg,
      error: p.error,
      errorBg: p.errorBg,
      errorFg: p.errorFg,
      info: p.info,
      infoBg: p.infoBg,
      infoFg: p.infoFg,
    );

    final radiusInput = BorderRadius.circular(radiusMd);
    final radiusCard = BorderRadius.circular(radiusLg);

    return ThemeData(
      useMaterial3: true,
      brightness: p.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: p.bg,
      dividerColor: p.divider,
      iconTheme: IconThemeData(color: p.textPrimary),

      // Поля ввода
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        border: OutlineInputBorder(
          borderRadius: radiusInput,
          borderSide: BorderSide(color: p.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusInput,
          borderSide: BorderSide(color: p.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusInput,
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusInput,
          borderSide: BorderSide(color: p.error),
        ),
      ),

      // Заполненная кнопка (CTA)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: primary,
          foregroundColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(borderRadius: radiusInput),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),

      // Текстовая/контурная кнопка (вторичная)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: Colors.transparent,
          foregroundColor: primary,
          side: BorderSide(color: p.border),
          shape: RoundedRectangleBorder(borderRadius: radiusInput),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),

      // Карточка
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: radiusCard,
          side: BorderSide(color: p.border),
        ),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primary,
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
      ),

      // Bottom navigation
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.surface,
        elevation: 0,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            color: selected ? primary : p.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? primary : p.textSecondary,
            size: 24,
          );
        }),
      ),

      // AppBar — прозрачный, иконки primary, как было
      appBarTheme: AppBarTheme(
        backgroundColor: p.bg,
        foregroundColor: p.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: primary),
        centerTitle: false,
      ),

      // Типографика — масштаб из дизайн-системы
      textTheme: TextTheme(
        // display 28/700
        displaySmall: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w700, height: 1.25,
          color: p.textPrimary, letterSpacing: -0.28,
        ),
        // title 20/700
        titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, height: 1.25,
          color: p.textPrimary,
        ),
        // headline 17/600
        titleMedium: TextStyle(
          fontSize: 17, fontWeight: FontWeight.w600, height: 1.35,
          color: p.textPrimary,
        ),
        // body 15/400
        bodyLarge: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w400, height: 1.45,
          color: p.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w400, height: 1.45,
          color: p.textSecondary,
        ),
        // label 13/500
        labelLarge: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, height: 1.35,
          color: p.textPrimary,
        ),
        // caption 11/500
        labelSmall: TextStyle(
          fontSize: 11, fontWeight: FontWeight.w500, height: 1.35,
          color: p.textSecondary, letterSpacing: 0.22,
        ),
      ),

      extensions: <ThemeExtension<dynamic>>[appColors],
    );
  }
}

/// Внутренний контейнер для палитры — чтобы _build() не таскал
/// 25 параметров по отдельности.
class _Palette {
  final Color bg;
  final Color surface;
  final Color surfaceTinted;
  final Color surfaceHover;
  final Color onPrimary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textOnTinted;
  final Color border;
  final Color borderStrong;
  final Color divider;
  final Color success;
  final Color successBg;
  final Color successFg;
  final Color warning;
  final Color warningBg;
  final Color warningFg;
  final Color error;
  final Color errorBg;
  final Color errorFg;
  final Color info;
  final Color infoBg;
  final Color infoFg;
  final Brightness brightness;

  const _Palette({
    required this.bg,
    required this.surface,
    required this.surfaceTinted,
    required this.surfaceHover,
    required this.onPrimary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textOnTinted,
    required this.border,
    required this.borderStrong,
    required this.divider,
    required this.success,
    required this.successBg,
    required this.successFg,
    required this.warning,
    required this.warningBg,
    required this.warningFg,
    required this.error,
    required this.errorBg,
    required this.errorFg,
    required this.info,
    required this.infoBg,
    required this.infoFg,
    required this.brightness,
  });
}
