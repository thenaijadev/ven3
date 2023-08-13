import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/error_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/home_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/login_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/registration_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
