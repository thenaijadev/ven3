import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/error_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/home_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/login_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/registration_screen.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/protein.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/soups.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/pages/home.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/food_type.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.soups:
        return MaterialPageRoute(
          builder: (_) => const SoupsScreen(),
        );

      case Routes.meats:
        return MaterialPageRoute(
          builder: (_) => const MeatScreen(),
        );
      case Routes.foodType:
        var data = routeSettings.arguments as Food;
        return MaterialPageRoute(
          builder: (_) => FoodTypeScreen(
            food: data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
