import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/screens/sign_up_screen.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
              text: 'لا امتلك حساب؟',
              style: AppTextStyles.semiBold16.copyWith(
                color: Color(0xff949d9e),
              )),
          TextSpan(
              text: ' ',
              style: AppTextStyles.semiBold16.copyWith(
                color: Color(0xff616a6b),
              )),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              text: 'قم بإنساء حساب',
              style: AppTextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              ))
        ],
      ),
    );
  }
}
