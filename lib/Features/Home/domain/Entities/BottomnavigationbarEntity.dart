import 'package:in_egypt/core/utils/images.dart';

class BottomnavigationbarEntity {
  String title;
  String iconPath;
  BottomnavigationbarEntity({
    required this.title,
    required this.iconPath,
  });

  static List<BottomnavigationbarEntity> bottomnavigationbarEntityList() => [
        BottomnavigationbarEntity(
          title: "الرئيسية",
          iconPath: Assets.assetsIconsBottomNavBarInActiveHomeIcon,
        ),
        BottomnavigationbarEntity(
          title: "رحلاتي",
          iconPath: Assets.assetsIconsBottomNavBarInActiveTripsIcon,
        ),
        BottomnavigationbarEntity(
          title: "المفضلة",
          iconPath: Assets.assetsIconsBottomNavBarInActiveFavouriteIcon,
        ),
        BottomnavigationbarEntity(
          title: "حسابي",
          iconPath: Assets.assetsIconsBottomNavBarInActiveProfileIcon,
        ),
      ];
}
