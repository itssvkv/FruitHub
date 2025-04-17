import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
  });
  final void Function() onPressed;
  final String buttonText;
  final bool isLoading;
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
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                                ),
                ))
            : Text(buttonText,
                style: TextStyle(
                  color: Colors.white,
                )),
      ),
    );
  }
}
