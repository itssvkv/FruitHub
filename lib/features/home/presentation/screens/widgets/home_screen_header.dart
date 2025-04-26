import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper/get_user.dart';

import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widgets/notification_widget.dart';

import '../../../../../core/utils/app_images.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationWidget(),
      leading: Image.asset(Assets.assetsImagesProfile),
      title: Text(
        'صباح الخير..!',
        textAlign: TextAlign.right,
        style: AppTextStyles.regular16.copyWith(
          color: Color(0xff949d9e),
        ),
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: AppTextStyles.bold16,
      ),
    );
  }
}
