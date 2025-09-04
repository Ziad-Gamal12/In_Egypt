import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Onboarding/Domain/Entities/OnBoardingPageViewItemEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:liquid_glass/liquid_glass.dart';

class OnBoardingGlassContainer extends StatelessWidget {
  const OnBoardingGlassContainer({super.key, required this.entity});

  final OnBoardingPageViewItemEntity entity;

  @override
  Widget build(BuildContext context) {
    AppTextStyles textStyles = AppTextStyles(context);
    return LiquidGlass(
      borderRadius: BorderRadius.circular(8),
      blur: 15,
      opacity: 0.1,
      tint: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entity.title,
              style: textStyles.bold48.copyWith(color: Colors.white),
            ).animate(delay: 500.ms).moveX(duration: 500.ms, begin: 100),
            const SizedBox(height: 10),
            Text(
              entity.description,
              textAlign: TextAlign.justify,
              style: textStyles.regular14.copyWith(color: Colors.white),
            ).animate(delay: 1000.ms).moveX(duration: 500.ms, begin: 100),
          ],
        ),
      ),
    );
  }
}
