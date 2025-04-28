import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/screens/login_screen.dart';
import 'package:fruit_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/screens/best_selling_fruits_screen.dart';
import 'package:fruit_app/features/home/presentation/screens/main_screen.dart';

import '../../features/on_boarding/presentation/screen/on_boarding_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case 'on_boarding':
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case 'login':
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case 'signup':
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case 'home':
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case 'best_selling':
      return MaterialPageRoute(builder: (context) => const BestSellingScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold()); // Default route
  }
}
