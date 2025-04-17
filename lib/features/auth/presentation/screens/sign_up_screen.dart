import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/main_app_bar.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: mainAppBar(context, title: 'حساب جديد'),
        body: SignUpScreenBody(),
      ),
    );
  }
}
