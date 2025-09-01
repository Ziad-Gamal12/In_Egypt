// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomPlaceRatingWidget extends StatelessWidget {
  CustomPlaceRatingWidget({super.key, required this.rating, this.ratingColor});
  final double rating;
  Color? ratingColor;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        CustomRatingStarsRow(rating: rating),
        SizedBox(width: 5),
        Text(
          "$rating",
          style: AppTextStyles(
            context,
          ).medium12.copyWith(color: getRatingColor(isDark: isDark)),
        ),
      ],
    );
  }

  Color getRatingColor({required bool isDark}) {
    if (ratingColor != null) {
      return ratingColor!;
    } else {
      return isDark ? Colors.white : Colors.black;
    }
  }
}
