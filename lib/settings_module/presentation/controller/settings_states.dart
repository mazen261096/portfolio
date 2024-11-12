import 'package:flutter/material.dart';
class SettingsState {
  final Locale locale;
  final ThemeData theme;

  SettingsState({required this.locale, required this.theme});

  SettingsState copyWith({Locale? locale, ThemeData? theme}) {
    return SettingsState(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
    );
  }
}