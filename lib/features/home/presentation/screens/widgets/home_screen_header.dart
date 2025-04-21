import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_images.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.assetsImagesNotification),
      ),
      leading: Image.asset(Assets.assetsImagesProfile),
      title: Text(
        'صباح الخير..!',
        textAlign: TextAlign.right,
        style: AppTextStyles.regular16.copyWith(
          color: Color(0xff949d9e),
        ),
      ),
      subtitle: Text(
        'Mohamed',
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16,
      ),
    );
  }
}
