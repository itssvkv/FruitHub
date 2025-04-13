import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key, required this.onPressed, required this.buttonText});
  final void Function() onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        onPressed: onPressed,
        child: Text(buttonText,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
