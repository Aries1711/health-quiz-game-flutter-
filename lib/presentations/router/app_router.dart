import 'package:flutter/material.dart';
import 'package:game_health_efa/presentations/screens/intro_screens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => IntroScreen(
            title: "Welcome",
          ),
        );
        break;
      default:
    }
  }
}
