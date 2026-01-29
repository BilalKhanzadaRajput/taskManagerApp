import 'package:flutter/material.dart';
import '../constants/colors_resource.dart';

/// Extension on BuildContext for easier access to theme colors and styles
extension ThemeExtension on BuildContext {
  /// Check if dark theme is active
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Get primary color from theme
  Color get primaryColor => Theme.of(this).colorScheme.primary;

  /// Get background color based on theme
  Color get backgroundColor => isDarkMode
      ? ColorsResource.DARK_BACKGROUND_COLOR
      : ColorsResource.BACKGROUND_COLOR;

  /// Get card color based on theme
  Color get cardColor =>
      isDarkMode ? ColorsResource.DARK_CARD_COLOR : ColorsResource.CARD_COLOR;

  /// Get primary text color based on theme
  Color get primaryTextColor => isDarkMode
      ? ColorsResource.DARK_TEXT_PRIMARY_COLOR
      : ColorsResource.TEXT_PRIMARY_COLOR;

  /// Get secondary text color based on theme
  Color get secondaryTextColor => isDarkMode
      ? ColorsResource.DARK_TEXT_SECONDARY_COLOR
      : ColorsResource.TEXT_SECONDARY_COLOR;

  /// Get border color based on theme
  Color get borderColor => isDarkMode
      ? ColorsResource.DARK_BORDER_COLOR
      : ColorsResource.BORDER_COLOR;

  /// Get error color
  Color get errorColor => ColorsResource.ERROR_COLOR;

  /// Get success color
  Color get successColor => ColorsResource.SUCCESS_COLOR;

  /// Get warning color
  Color get warningColor => ColorsResource.WARNING_COLOR;

  /// Get info color
  Color get infoColor => ColorsResource.INFO_COLOR;
}
