import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/main_botton.dart';
import 'package:fruit_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/screens/widgets/terms_and_conditions.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/main_text_form_field.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, userName;
  bool isHidePassword = true;
  bool isTermsAccepted = false;
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
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupLoading) {
                    signupCubit.isLoading = true;
                  } else if (state is SignupSuccess) {
                    signupCubit.isLoading = false;
                    Navigator.pop(context);
                  } else if (state is SignupFailure) {
                    signupCubit.isLoading = false;
                    customSnackBar(context, state.message);
                  } else {
                    signupCubit.isLoading = false;
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    onPressed: () {
                      log('zipiii');
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (isTermsAccepted) {
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                                email,
                                password,
                                userName,
                              );
                        } else {
                          customSnackBar(
                            context,
                            'برجاء الموافقة على الشروط والإحكام',
                          );
                        }
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
