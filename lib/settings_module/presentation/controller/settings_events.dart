

import 'package:flutter/material.dart';
class SettingsEvent {}

class UpdateLanguageEvent extends SettingsEvent {
  final Locale locale;
  final BuildContext context;
  UpdateLanguageEvent(this.locale,this.context);
}

class UpdateThemeEvent extends SettingsEvent {
  final ThemeData theme;
  UpdateThemeEvent(this.theme);
}