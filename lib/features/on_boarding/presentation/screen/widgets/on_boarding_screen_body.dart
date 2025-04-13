import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/services/shared_preferences_service.dart';
import 'package:fruit_app/features/auth/presentation/screens/login_screen.dart';
import 'package:fruit_app/features/on_boarding/presentation/screen/widgets/on_boarding_page_view.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/main_botton.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: .5),
            activeColor: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 30),
        Visibility(
          visible: currentPage == 1,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: MainButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                SharedPreferencesService.setBool(kIsNotFirstTime, true);
              },
              buttonText: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(
          height: 43,
        )
      ],
    );
  }
}
