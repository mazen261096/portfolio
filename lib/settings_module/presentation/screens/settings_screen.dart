import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/service_locator.dart';

import '../controller/settings_bloc.dart';
import '../controller/settings_events.dart';
import '../controller/settings_states.dart';
import '../widgets/settings_toggle.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr())),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              // Dropdown for language selection
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Change Language'.tr()),
                    DropdownButton<Locale>(
                      value: state.locale,
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en'),
                          child: Text('English'),
                        ),
                        DropdownMenuItem(
                          value: Locale('ar'),
                          child: Text('العربية'),
                        ),
                      ],
                      onChanged: (Locale? newLocale) {
                        if (newLocale != null) {
                          sl<SettingsBloc>().add(UpdateLanguageEvent(newLocale, context));
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Toggle for dark theme
              SettingsToggle(
                title: 'Dark Theme',
                value: state.theme.brightness == Brightness.dark,
                onChanged: (bool isDarkMode) {
                  sl<SettingsBloc>().add(
                    UpdateThemeEvent(
                      isDarkMode ? ThemeData.dark() : ThemeData.light(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
