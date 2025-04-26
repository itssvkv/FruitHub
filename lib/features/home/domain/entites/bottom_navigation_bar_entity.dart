import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesBottomNavBoldHome,
          inActiveImage: Assets.assetsImagesBottomNavOutlineHome,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesBottomNavBoldProducts,
          inActiveImage: Assets.assetsImagesBottomNavOutlineProducts,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesBottomNavBoldShoppingCart,
          inActiveImage: Assets.assetsImagesBottomNavOutlineShoppingCart,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesBottomNavBoldUser,
          inActiveImage: Assets.assetsImagesBottomNavOutlineUser,
          name: 'حسابي'),
    ];
