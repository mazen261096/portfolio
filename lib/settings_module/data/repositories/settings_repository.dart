import 'package:flutter/material.dart';

class SettingsRepository {
  // You can replace this with actual local storage like SharedPreferences
  Locale _locale = Locale('en');
  ThemeData _theme = ThemeData.dark();

  Locale getCurrentLocale() {
    return _locale;
  }

  ThemeData getCurrentTheme() {
    return _theme;
  }

  void updateLocale(Locale locale) {
    _locale = locale;
  }

  void updateTheme(ThemeData theme) {
    _theme = theme;
  }
}
