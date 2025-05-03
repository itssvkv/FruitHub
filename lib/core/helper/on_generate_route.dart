import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/screens/login_screen.dart';
import 'package:fruit_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/screens/best_selling_fruits_screen.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/home/domain/entites/cart_entity.dart';

import 'package:fruit_app/features/home/presentation/screens/main_screen.dart';


import '../../features/on_boarding/presentation/screen/on_boarding_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case BestSellingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingScreen());

    case CheckoutScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => CheckoutScreen(
                cartEntity: settings.arguments as CartEntity,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold()); // Default route
  }
}
