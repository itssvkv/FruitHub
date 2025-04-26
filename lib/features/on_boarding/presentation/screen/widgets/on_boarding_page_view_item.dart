import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../../auth/presentation/screens/login_screen.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.image,
    required this.backgroundColor,
    required this.title,
    required this.description,
    required this.isSkipVisible,
  });
  final String image, backgroundColor;
  final Widget title, description;
  final bool isSkipVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundColor,
                fit: BoxFit.fill,
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isSkipVisible,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                    SharedPreferencesService.setValue(kIsNotFirstTime, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Text(
                      'تخط',
                      style: AppTextStyles.regular13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        description,
      ],
    );
  }
}
