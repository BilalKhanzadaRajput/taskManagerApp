import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/dimensions_resource.dart';

/// Centralized text styles for the application
/// All text styles should use these predefined styles instead of hard-coding
class AppTextStyles {
  // Display Styles
  static TextStyle displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge ?? _defaultDisplayLarge();
  }

  static TextStyle displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium ?? _defaultDisplayMedium();
  }

  static TextStyle displaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall ?? _defaultDisplaySmall();
  }

  // Headline Styles
  static TextStyle headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium ??
        _defaultHeadlineMedium();
  }

  // Title Styles
  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge ?? _defaultTitleLarge();
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium ?? _defaultTitleMedium();
  }

  // Body Styles
  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge ?? _defaultBodyLarge();
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium ?? _defaultBodyMedium();
  }

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall ?? _defaultBodySmall();
  }

  // Button Styles
  static TextStyle button(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  // Label Styles
  static TextStyle label(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_14.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  // Caption Styles
  static TextStyle caption(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_12.sp,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  // Default fallback styles
  static TextStyle _defaultDisplayLarge() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_32,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle _defaultDisplayMedium() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle _defaultDisplaySmall() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle _defaultHeadlineMedium() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle _defaultTitleLarge() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle _defaultTitleMedium() {
    return GoogleFonts.roboto(
      fontSize: DimensionsResource.FONT_SIZE_16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle _defaultBodyLarge() {
    return GoogleFonts.roboto(fontSize: DimensionsResource.FONT_SIZE_16);
  }

  static TextStyle _defaultBodyMedium() {
    return GoogleFonts.roboto(fontSize: DimensionsResource.FONT_SIZE_14);
  }

  static TextStyle _defaultBodySmall() {
    return GoogleFonts.roboto(fontSize: DimensionsResource.FONT_SIZE_12);
  }
}
