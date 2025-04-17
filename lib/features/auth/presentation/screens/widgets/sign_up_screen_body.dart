import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/terms_and_conditions.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../../../core/widgets/main_text_form_field.dart';
import '../../../../home/presentation/screens/home_screen.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, userName;
  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit = BlocProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              MainTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  userName = value!;
                },
              ),
              SizedBox(
                height: 16,
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
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Color(0xFFC9CECF),
                ),
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(onChanged: (value) {}),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  switch (state) {
                    case SignupInitial():
                      signupCubit.isLoading = false;
                    case SignupLoading():
                      signupCubit.isLoading = true;
                    case SignupSuccess():
                      signupCubit.isLoading = false;
                    case SignupFailure():
                      signupCubit.isLoading = false;
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              userName,
                            );
                        // Navigator.pop(context);
                        // Navigator.pushReplacementNamed(
                        //     context, HomeScreen.routeName);
                        // SharedPreferencesService.setBool(kIsLogin, true);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonText: 'إنشاء حساب جديد',
                    isLoading: signupCubit.isLoading,
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
