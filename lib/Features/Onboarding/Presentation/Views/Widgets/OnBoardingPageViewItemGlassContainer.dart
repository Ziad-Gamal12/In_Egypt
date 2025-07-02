import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glass/glass.dart';
import 'package:in_egypt/Features/Onboarding/Domain/Entities/OnBoardingPageViewItemEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class OnBoardingGlassContainer extends StatelessWidget {
  const OnBoardingGlassContainer({super.key, required this.entity});

  final OnBoardingPageViewItemEntity entity;

  @override
  Widget build(BuildContext context) {
    AppTextStyles textStyles = AppTextStyles(context);
    return Container(
          padding: const EdgeInsets.all(20),
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
        )
        .asGlass(blurX: 7, blurY: 7)
        .animate()
        .fadeIn(duration: 600.ms, curve: Curves.easeInOut);
  }
}
