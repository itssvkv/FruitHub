import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
              text: 'تمتلك حساب بالفعل؟',
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

                  Navigator.pop(context);
                },
              text: 'تسجيل الدخول',
              style: AppTextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              ))
        ],
      ),
    );
  }
}
