// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomNoReviewsWidget extends StatelessWidget {
  const CustomNoReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.assetsIconsNoReviews,
          height: 150,
          width: 150,
          fit: BoxFit.fill,
        ),
        Text(
          "لا يوجد تقييمات",
          textAlign: TextAlign.center,
          style: AppTextStyles(
            context,
          ).semiBold20.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
