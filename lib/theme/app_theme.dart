import 'package:flutter/material.dart';

/// Shared color tokens used across Login, Sign-Up, and Home.
/// Palette: deep teal + dark ink, with warm beige/peach accents.
class AppColors {
  static const Color primary = Color(0xFF116466);      // deep teal — buttons, links, active states
  static const Color primaryDark = Color(0xFF0B4547);   // darker teal — gradients, pressed states
  static const Color navy = Color(0xFF2C3531);          // dark ink — headings, dark hero background
  static const Color beige = Color(0xFFD9B08C);         // warm accent
  static const Color peach = Color(0xFFFFCB9A);         // light warm accent
  static const Color mist = Color(0xFFD1E2E2);          // light cool neutral
  static const Color background = Color(0xFFF6F8F7);    // app background
  static const Color inputFill = Color(0xFFEDF3F2);     // soft filled input background
  static const Color textMuted = Color(0xFF5C6B67);     // secondary text
  static const Color border = Color(0xFFE1EAE8);        // soft border
  static const Color success = Color(0xFF2E7D5B);
  static const Color successBg = Color(0xFFEFF6F1);
  static const Color successBorder = Color(0xFFCBE3D4);
}

/// One shared theme so all three screens look consistent.
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w800,
          color: AppColors.navy,
          letterSpacing: -0.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.5,
          color: AppColors.textMuted,
          height: 1.45,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: const TextStyle(color: Color(0xFF8FA29D), fontSize: 15),
        errorStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.8),
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
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          elevation: 3,
          shadowColor: AppColors.primary.withOpacity(0.35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
