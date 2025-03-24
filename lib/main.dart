//mmmmmmmm

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/auth_module/presentation/controller/auth_bloc.dart';
import 'package:portfolio/auth_module/presentation/screens/login_screen/login_screen.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_bloc.dart';
import 'package:portfolio/settings_module/presentation/controller/settings_states.dart';
import 'package:portfolio/settings_module/presentation/screens/settings_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/utils/routes_manager.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

const supabaseUrl = 'https://vjkzigqgootdjxrwreya.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqa3ppZ3Fnb290ZGp4cndyZXlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0MDIwMzgsImV4cCI6MjA1NDk3ODAzOH0.Qk99nIep0OFVElc3dGmEkzE-p18Yu0YBGGO-Do6nRrs';
final supabase = Supabase.instance.client;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);


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
          return MaterialApp.router(
            theme: settingsState.theme,
            locale: settingsState.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routerConfig: router,
          );
        },
      ),
    );
  }
}



