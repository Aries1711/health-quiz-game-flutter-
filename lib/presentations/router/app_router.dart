// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:game_health_efa/presentations/screens/biodata_screen.dart';
import 'package:game_health_efa/presentations/screens/info_screen.dart';
import 'package:game_health_efa/presentations/screens/intro_screen.dart';
import 'package:game_health_efa/presentations/screens/level_1/finish_level.dart';
import 'package:game_health_efa/presentations/screens/level_1/question_a.dart';
import 'package:game_health_efa/presentations/screens/level_2/finish_level.dart';
import 'package:game_health_efa/presentations/screens/level_2/question_a.dart';
import 'package:game_health_efa/presentations/screens/level_3/finish_level.dart';
import 'package:game_health_efa/presentations/screens/level_3/question_a.dart';
import 'package:game_health_efa/presentations/screens/level_screen.dart';
import 'package:game_health_efa/presentations/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(
            title: "Welcome",
          ),
        );
      case '/intro':
        return MaterialPageRoute(
          builder: (_) => IntroScreen(
            title: "Welcome",
          ),
        );
      case '/info':
        return MaterialPageRoute(
          builder: (_) => InfoScreen(
            title: "Tentang Game",
          ),
        );
      case '/biodata':
        return MaterialPageRoute(
          builder: (_) => BiodataScreen(
            title: "Biodata User",
          ),
        );
      case '/level':
        return MaterialPageRoute(
          builder: (_) => LevelsScreen(
            title: "Select Level",
          ),
        );

      //route for level 1
      case '/level_a/question_a':
        return MaterialPageRoute(
          builder: (_) => QuestionA(
            title: "Select Level",
          ),
        );
      case '/level_a/finish':
        return MaterialPageRoute(
          builder: (_) => FinishScreenLevelA(
            title: "Finish Screen Level A",
          ),
        );

      //route for level 2
      case '/level_b/question_a':
        return MaterialPageRoute(
          builder: (_) => QuestionATwo(
            title: "Select Level",
          ),
        );
      case '/level_b/finish':
        return MaterialPageRoute(
          builder: (_) => FinishScreenLevelB(
            title: "Finish Screen Level B",
          ),
        );

      //route for level 3
      case '/level_c/question_a':
        return MaterialPageRoute(
          builder: (_) => QuestionAThree(
            title: "Select Level",
          ),
        );
      case '/level_c/finish':
        return MaterialPageRoute(
          builder: (_) => FinishScreenLevelC(
            title: "Finish Screen Level C",
          ),
        );

        break;
      default:
    }
  }
}
