import 'package:flutter/material.dart';
import '../../data/repositories/settings_repository.dart';

class UpdateLanguageUseCase {
  final SettingsRepository repository;

  UpdateLanguageUseCase(this.repository);

  void execute(Locale locale) {
    repository.updateLocale(locale);
  }
}
