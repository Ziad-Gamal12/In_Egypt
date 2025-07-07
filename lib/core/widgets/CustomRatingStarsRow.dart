import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomRatingStarItem.dart';

class CustomRatingStarsRow extends StatelessWidget {
  const CustomRatingStarsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingStarItem(isFilled: true),
        CustomRatingStarItem(isFilled: true),
        CustomRatingStarItem(isFilled: true),
        CustomRatingStarItem(isFilled: true),
        CustomRatingStarItem(isFilled: false),
      ],
    );
  }
}
