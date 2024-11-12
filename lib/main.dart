//mmmmmmmm

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/auth_module/presentation/controller/auth_bloc.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_bloc.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_states.dart';
import 'package:portfolio/settings_module/presentation/screens/settings_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  ServiceLocator.initSl();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => sl<SettingsBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return MaterialApp(
            theme: settingsState.theme,
            locale: settingsState.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            home: SettingsScreen(),
          );
        },
      ),
    );
  }
}
