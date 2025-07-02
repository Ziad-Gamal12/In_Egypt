import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomOnBoardingSkipText extends StatelessWidget {
  const CustomOnBoardingSkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              top: 10,
              bottom: 10,
              right: 30,
            ),

            child: Text(
              "تخط",
              style: AppTextStyles(
                context,
              ).regular16.copyWith(color: Colors.black),
            ),
          ).asGlass(
            clipBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
    );
  }
}
