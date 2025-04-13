import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/login_screen_body.dart';

import '../../../../core/widgets/main_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: 'تسجيل دخول'),
      body: LoginScreenBody(),
    );
  }
}
