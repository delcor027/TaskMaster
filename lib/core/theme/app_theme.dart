import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF4F60FF);
  static const primaryHover = Color(0xFF3D4CEE);
  static const backgroundLight = Color(0xFFFFFFFF);
  static const surfaceLight = Color(0xFFF5F5F5);
  static const error = Color(0xFFE4574F);
  static const warning = Color(0xFFFF845F);
  static const accent = Color(0xFF19C37D);
  static const surfaceDark = Color(0xFF1C1C1C);
  static const black100 = Color(0xFF111111);
  static const backgroundDark = Color(0xFF121212);
  static const gray70 = Color(0xFF666666);
  static const gray20 = Color(0xFFC8C8C8);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        error: AppColors.error,
        surface: AppColors.surfaceLight,
      ),
       textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
    );
  }
}
