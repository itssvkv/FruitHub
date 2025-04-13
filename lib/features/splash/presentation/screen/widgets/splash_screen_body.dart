import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/constants.dart';
import 'package:fruit_app/core/services/shared_preferences_service.dart';
import 'package:fruit_app/features/auth/presentation/screens/login_screen.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../on_boarding/presentation/screen/on_boarding_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (SharedPreferencesService.getBool(kIsNotFirstTime)) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesBubbles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
