import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Onboarding/Domain/Entities/OnBoardingPageViewItemEntity.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/OnBoardingPageViewItemBackground.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/OnBoardingPageViewItemGlassContainer.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem(
      {super.key, required this.entity, required this.index});
  final OnBoardingPageViewItemEntity entity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewItemBackground(
      imagePath: entity.imagePath,
      child: OnBoardingGlassContainer(entity: entity, index: index),
    );
  }
}
