import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/constants.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/core/widgets/main_text_form_field.dart';
import 'package:fruit_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/or_divider.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/social_login_button.dart';
import 'package:fruit_app/features/home/presentation/screens/home_screen.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isHidePassword = true;
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 26,
              ),
              MainTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              MainTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidePassword = !isHidePassword;
                    });
                  },
                  icon: Icon(
                    isHidePassword ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFC9CECF),
                  ),
                ),
                onSaved: (value) {
                  password = value!;
                },
                isHidePassword: isHidePassword,
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
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    loginCubit.isLoading = true;
                  } else if (state is LoginSuccess) {
                    loginCubit.isLoading = false;
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                    SharedPreferencesService.setValue(kIsLogin, true);
                  } else if (state is LoginFailure) {
                    loginCubit.isLoading = false;
                    customSnackBar(context, state.message);
                  } else {
                    loginCubit.isLoading = false;
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    onPressed: () {
                      log('zipiii');
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<LoginCubit>().signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonText: 'تسجيل دخول',
                    isLoading: loginCubit.isLoading,
                  );
                },
              ),
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
                onPressed: () {
                  loginCubit.signInWithGoogle();
                },
                title: 'تسجيل بواسطة جوجل',
              ),
              Platform.isIOS
                  ? Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        SocialLoginButton(
                          icon: Assets.assetsImagesApplIcon,
                          onPressed: () {},
                          title: 'تسجيل بواسطة أبل',
                        )
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                icon: Assets.assetsImagesFacebookIcon,
                onPressed: () {
                  loginCubit.signInWithFacebook();
                },
                title: 'تسجيل بواسطة فيسبوك',
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
