import 'package:flutter/material.dart';

import 'widgets/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = 'on_boarding';
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreenBody();
  }
}
