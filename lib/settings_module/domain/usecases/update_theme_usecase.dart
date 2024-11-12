import 'package:flutter/material.dart';

import '../../data/repositories/settings_repository.dart';

class UpdateThemeUseCase {
  final SettingsRepository repository;

  UpdateThemeUseCase(this.repository);

  void execute(ThemeData theme) {
    repository.updateTheme(theme);
  }
}
