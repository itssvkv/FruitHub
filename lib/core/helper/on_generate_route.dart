import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/screens/login_screen.dart';

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
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold()); // Default route
  }
}
