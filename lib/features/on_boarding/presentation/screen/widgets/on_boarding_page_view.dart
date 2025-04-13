import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

import 'on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingPageViewItem(
          isSkipVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          image: Assets.assetsImagesOnBoarding1Image,
          backgroundColor: Assets.assetsImagesOnBoarding1BackgroundImage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'مرحبا بك في',
                style: AppTextStyles.bold23,
              ),
              Text(
                'HUB',
                style: AppTextStyles.bold23
                    .copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
          description: Text(
            'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13,
          ),
        ),
        OnBoardingPageViewItem(
          isSkipVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          image: Assets.assetsImagesOnBoarding2Image,
          backgroundColor: Assets.assetsImagesOnBoarding2BackgroundImage,
          title: Text(
            'ابحث وتسوق',
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          description: Text(
            'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13,
          ),
        ),
      ],
    );
  }
}
