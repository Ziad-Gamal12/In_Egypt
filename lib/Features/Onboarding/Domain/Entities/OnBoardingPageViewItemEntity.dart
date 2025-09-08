import 'package:in_egypt/core/utils/images.dart';

class OnBoardingPageViewItemEntity {
  final String imagePath;
  final String title;
  final String title2;

  OnBoardingPageViewItemEntity({
    required this.imagePath,
    required this.title,
    required this.title2,
  });

  static List<OnBoardingPageViewItemEntity> toList() {
    return [
      OnBoardingPageViewItemEntity(
        imagePath: Assets.assetsImagesArtboard3,
        title: "معالم",
        title2: "مصـــر",
      ),
      OnBoardingPageViewItemEntity(
          imagePath: Assets.assetsImagesArtboard2,
          title: "شواطئ",
          title2: "مصــــــر"),
      OnBoardingPageViewItemEntity(
          imagePath: Assets.assetsImagesArtboard1,
          title2: "مصــــر",
          title: "صحاري"),
    ];
  }
}
