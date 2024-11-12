import '../entities/settings_entity.dart';
import '../../data/repositories/settings_repository.dart';

class GetCurrentSettingsUseCase {
  final SettingsRepository repository;

  GetCurrentSettingsUseCase(this.repository);

  SettingsEntity execute() {
    return SettingsEntity(
      locale: repository.getCurrentLocale(),
      theme: repository.getCurrentTheme(),
    );
  }
}
