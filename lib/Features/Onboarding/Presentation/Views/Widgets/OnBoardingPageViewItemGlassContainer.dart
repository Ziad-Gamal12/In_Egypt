import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Onboarding/Domain/Entities/OnBoardingPageViewItemEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class OnBoardingGlassContainer extends StatelessWidget {
  const OnBoardingGlassContainer(
      {super.key, required this.entity, required this.index});

  final OnBoardingPageViewItemEntity entity;
  final int index;
  @override
  Widget build(BuildContext context) {
    AppTextStyles textStyles = AppTextStyles(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "أكتشــــف",
            style: textStyles.regular30
                .copyWith(color: index == 2 ? Colors.black : Colors.amber),
          ),
          const SizedBox(height: 2),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Text(
                entity.title,
                textAlign: TextAlign.justify,
                style: textStyles.extrabold70.copyWith(
                    color: index == 2 ? Color(0xffB3826C) : Colors.white),
              ),
              Column(
                children: [
                  Text("",
                      textAlign: TextAlign.justify, style: textStyles.bold63),
                  Text(
                    entity.title2,
                    textAlign: TextAlign.justify,
                    style: textStyles.extrabold70.copyWith(
                        color: index == 2 ? Color(0xffB3826C) : Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
