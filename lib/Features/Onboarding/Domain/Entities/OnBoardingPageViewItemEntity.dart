import 'package:in_egypt/core/utils/images.dart';

class OnBoardingPageViewItemEntity {
  final String imagePath;
  final String title;
  final String description;

  OnBoardingPageViewItemEntity({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  static List<OnBoardingPageViewItemEntity> toList() {
    return [
      OnBoardingPageViewItemEntity(
        imagePath: Assets.assetsImagesOnboardingHistoric,
        title: "اكتشف تاريخ مصر العريق",
        description:
            "استكشف الحضارات القديمة والمعالم الأثرية التي صنعت مجد التاريخ.",
      ),
      OnBoardingPageViewItemEntity(
        imagePath: Assets.assetsImagesOnboardingBeach,
        title: "استمتع بأجمل شواطئ مصر	",
        description:
            "استرخي على الرمال الذهبية والمياه الصافية في أجمل سواحل مصر الخلابة.",
      ),
      OnBoardingPageViewItemEntity(
        imagePath: Assets.assetsImagesOnboardingDessert,
        title: "مغامرة وسط الصحراء",
        description:
            "عِش تجربة لا تُنسى وسط الرمال والصخور وجمال الليالي المليئة بالنجوم.",
      ),
    ];
  }
}
