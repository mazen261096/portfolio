


import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/strings_manager.dart';

import '../../auth_module/domain/entities/user.dart';
import '../../auth_module/presentation/screens/login_screen/login_screen.dart';
import '../../auth_module/presentation/screens/register_screen/register_screen.dart';
import '../../portfolio_module/presentation/screens/home_screen.dart';





class Routes {
  static const String homeRoute = "/homeRoute";
  static const String login = "/loginRoute";
  static const String register = "/registerRoute";
  static late  AppUser receiverUser ;

}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>   const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>   const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) =>   const RegisterScreen());


      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteManager),
          ),
          body: const Center(
            child: Text(StringsManager.noRouteManager),
          ),
        ));
  }
}
