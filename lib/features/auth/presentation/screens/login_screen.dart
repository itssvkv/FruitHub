import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/login_screen_body.dart';

import '../../../../core/widgets/main_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: mainAppBar(context, title: 'تسجيل دخول'),
        body: LoginScreenBody(),
      ),
    );
  }
}
