import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/core/widgets/main_text_form_field.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/or_divider.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/social_login_button.dart';
import 'package:fruit_app/features/home/presentation/screens/home_screen.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../../../../core/utils/app_images.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 26,
            ),
            MainTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            MainTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.visibility,
                color: Color(0xFFC9CECF),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'نسيت كلمة المرور؟',
              style: AppTextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 32,
            ),
            MainButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  SharedPreferencesService.setBool(kIsLogin, true);
                },
                buttonText: 'تسجيل دخول'),
            SizedBox(
              height: 32,
            ),
            DontHaveAnAccountWidget(),
            SizedBox(
              height: 37,
            ),
            OrDivider(),
            SizedBox(
              height: 21,
            ),
            SocialLoginButton(
              icon: Assets.assetsImagesGoogleIcon,
              onPressed: () {},
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              icon: Assets.assetsImagesApplIcon,
              onPressed: () {},
              title: 'تسجيل بواسطة أبل',
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              icon: Assets.assetsImagesFacebookIcon,
              onPressed: () {},
              title: 'تسجيل بواسطة فيسبوك',
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
