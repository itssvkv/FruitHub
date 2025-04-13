import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/terms_and_conditions.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../../../core/widgets/main_text_form_field.dart';
import '../../../../home/presentation/screens/home_screen.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            MainTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 16,
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
            TermsAndConditionsWidget(onChanged: (value) {}),
            SizedBox(
              height: 30,
            ),
            MainButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  SharedPreferencesService.setBool(kIsLogin, true);
                },
                buttonText: 'إنشاء حساب جديد'),
            SizedBox(
              height: 24,
            ),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
