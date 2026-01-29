import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeModeKey = 'theme_mode';

  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system)) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeModeKey);

      if (themeModeString != null) {
        final themeMode = _parseThemeMode(themeModeString);
        emit(ThemeState(themeMode: themeMode));
      }
    } catch (e) {
      // If loading fails, use system default
      emit(const ThemeState(themeMode: ThemeMode.system));
    }
  }

  Future<void> toggleTheme([Brightness? systemBrightness]) async {
    ThemeMode newMode;

    if (state.themeMode == ThemeMode.system) {
      // If currently system mode, switch to opposite of system brightness
      final brightness = systemBrightness ?? Brightness.light;
      newMode = brightness == Brightness.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    } else {
      // Toggle between light and dark
      newMode = state.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    }

    await setThemeMode(newMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeModeKey, _themeModeToString(mode));
      emit(ThemeState(themeMode: mode));
    } catch (e) {
      // If saving fails, still update the state
      emit(ThemeState(themeMode: mode));
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode _parseThemeMode(String modeString) {
    switch (modeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  bool get isDarkMode {
    if (state.themeMode == ThemeMode.system) {
      // For system mode, we can't determine without context
      // This will be handled by MaterialApp
      return false;
    }
    return state.themeMode == ThemeMode.dark;
  }
}
