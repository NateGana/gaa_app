import 'package:flutter/material.dart';

/// G.A.A — Gaming Addict Association
/// Premium gaming color palette shared by Login, Sign-Up, and Home,
/// with a distinct set of colors for dark mode and light mode.
class AppPalette {
  final Color scaffoldBg;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color heroStart;
  final Color heroEnd;
  final Color textPrimary;
  final Color textMuted;
  final Color cyan;
  final Color cyanSoft;
  final Color orange;
  final Color orangeSoft;
  final Color onOrange;

  const AppPalette({
    required this.scaffoldBg,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.heroStart,
    required this.heroEnd,
    required this.textPrimary,
    required this.textMuted,
    required this.cyan,
    required this.cyanSoft,
    required this.orange,
    required this.orangeSoft,
    required this.onOrange,
  });

  /// Deep black / dark teal, bright cyan + warm orange accents.
  static const dark = AppPalette(
    scaffoldBg: Color(0xFF0A1012),
    surface: Color(0xFF10191B),
    surfaceAlt: Color(0xFF132426),
    border: Color(0xFF1E3336),
    heroStart: Color(0xFF07100F),
    heroEnd: Color(0xFF116466),
    textPrimary: Color(0xFFEAF6F4),
    textMuted: Color(0xFF8CA6A3),
    cyan: Color(0xFF3FE0DB),
    cyanSoft: Color(0xFFB6F3F0),
    orange: Color(0xFFFF9B4D),
    orangeSoft: Color(0xFFFFCB9A),
    onOrange: Color(0xFF0A1012),
  );

  /// Clean, bright gaming-store look: light background, deep readable
  /// text, and slightly deeper cyan/orange for contrast on white.
  static const light = AppPalette(
    scaffoldBg: Color(0xFFF2F7F6),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFE9F2F1),
    border: Color(0xFFD9E7E5),
    heroStart: Color(0xFF0B1E20),
    heroEnd: Color(0xFF116466),
    textPrimary: Color(0xFF10262A),
    textMuted: Color(0xFF5B726E),
    cyan: Color(0xFF0E8E88),
    cyanSoft: Color(0xFFBEE7E4),
    orange: Color(0xFFE8823C),
    orangeSoft: Color(0xFFFFE0C2),
    onOrange: Color(0xFF0A1012),
  );

  /// Picks dark or light based on the currently active app theme.
  static AppPalette of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }
}

/// Builds the two ThemeData objects the app switches between.
class AppTheme {
  static ThemeData _build(AppPalette p, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: p.scaffoldBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: p.cyan,
        brightness: brightness,
        primary: p.cyan,
        secondary: p.orange,
        surface: p.surface,
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w800,
          color: p.textPrimary,
          letterSpacing: -0.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.5,
          color: p.textMuted,
          height: 1.45,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surfaceAlt,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: TextStyle(color: p.textMuted.withOpacity(0.7), fontSize: 15),
        errorStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: p.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: p.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: p.cyan, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: p.orange,
          foregroundColor: p.onOrange,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.textPrimary,
          side: BorderSide(color: p.border),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData get dark => _build(AppPalette.dark, Brightness.dark);
  static ThemeData get light => _build(AppPalette.light, Brightness.light);
}
