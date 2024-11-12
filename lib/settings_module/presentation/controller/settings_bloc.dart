import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_events.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_states.dart';
import '../../domain/usecases/get_current_settings.dart';
import '../../domain/usecases/update_language_usecase.dart';
import '../../domain/usecases/update_theme_usecase.dart';


class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final GetCurrentSettingsUseCase getCurrentSettings;
  final UpdateLanguageUseCase updateLanguage;
  final UpdateThemeUseCase updateTheme;

  SettingsBloc(
      this.getCurrentSettings,
      this.updateLanguage,
      this.updateTheme,
      ) : super(SettingsState(
    locale: getCurrentSettings.execute().locale,
    theme: getCurrentSettings.execute().theme,
  )) {


    on<UpdateLanguageEvent>((event, emit) async {
      updateLanguage.execute(event.locale);
      await event.context.setLocale(event.locale);
      emit(state.copyWith(locale: event.locale));
    });


    on<UpdateThemeEvent>((event, emit) {
      updateTheme.execute(event.theme);
      emit(state.copyWith(theme: event.theme));
    });

  }
}
