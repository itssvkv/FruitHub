import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          'أو',
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold16,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        ),
      ],
    );
  }
}
