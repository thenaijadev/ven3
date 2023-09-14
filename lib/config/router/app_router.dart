import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/error_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/home_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/login_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/phone_number_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/pages/registration_screen.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/screens/cart_screen.dart';

import 'package:the_food_hub_nsk_nig/features/payment/presentation/screens/add_new_card_screen.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/product_category_screen.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/buttom_nav_bar.dart';
import 'package:the_food_hub_nsk_nig/features/products/presentation/screens/product_details_screen.dart';

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

      case Routes.categoryProducts:
        var data = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CategoryProductsScreen(
            productData: data,
          ),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.payment:
        return MaterialPageRoute(
          builder: (_) => const AddNewCardScreen(),
        );

      case Routes.verifyPhoneNo:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberScreen(),
        );
      case Routes.productDetails:
        var data = routeSettings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            data: data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
