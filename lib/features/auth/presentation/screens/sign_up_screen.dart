import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/main_app_bar.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: 'حساب جديد'),
      body: SignUpScreenBody(),
    );
  }
}
