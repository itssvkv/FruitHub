import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});
  final void Function() onPressed;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Color(0xffdcdede), width: 1))),
      child: ListTile(
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: AppTextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
