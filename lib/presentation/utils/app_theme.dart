import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';

/// Centralized theme management for the application
/// Provides light and dark themes with consistent styling

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsResource.PRIMARY_COLOR,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: ColorsResource.BACKGROUND_COLOR,
      cardColor: ColorsResource.CARD_COLOR,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_32,
          fontWeight: FontWeight.bold,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_28,
          fontWeight: FontWeight.bold,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        displaySmall: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_24,
          fontWeight: FontWeight.w600,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_20,
          fontWeight: FontWeight.w600,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_18,
          fontWeight: FontWeight.w600,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_16,
          fontWeight: FontWeight.w500,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_16,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_14,
          color: ColorsResource.TEXT_PRIMARY_COLOR,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_12,
          color: ColorsResource.TEXT_SECONDARY_COLOR,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsResource.PRIMARY_COLOR,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsResource.PRIMARY_COLOR,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsResource.CARD_COLOR,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(color: ColorsResource.BORDER_COLOR),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(color: ColorsResource.BORDER_COLOR),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(
            color: ColorsResource.PRIMARY_COLOR,
            width: 2,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsResource.PRIMARY_COLOR,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: ColorsResource.DARK_BACKGROUND_COLOR,
      cardColor: ColorsResource.DARK_CARD_COLOR,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_32,
          fontWeight: FontWeight.bold,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_28,
          fontWeight: FontWeight.bold,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        displaySmall: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_24,
          fontWeight: FontWeight.w600,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_20,
          fontWeight: FontWeight.w600,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_18,
          fontWeight: FontWeight.w600,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_16,
          fontWeight: FontWeight.w500,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_16,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_14,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_12,
          color: ColorsResource.DARK_TEXT_SECONDARY_COLOR,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsResource.DARK_CARD_COLOR,
        foregroundColor: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        elevation: 0,
        titleTextStyle: GoogleFonts.roboto(
          fontSize: DimensionsResource.FONT_SIZE_20,
          fontWeight: FontWeight.w600,
          color: ColorsResource.DARK_TEXT_PRIMARY_COLOR,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsResource.PRIMARY_COLOR,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsResource.DARK_CARD_COLOR,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(color: ColorsResource.DARK_BORDER_COLOR),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(color: ColorsResource.DARK_BORDER_COLOR),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResource.RADIUS_8),
          borderSide: const BorderSide(
            color: ColorsResource.PRIMARY_COLOR,
            width: 2,
          ),
        ),
      ),
    );
  }
}
