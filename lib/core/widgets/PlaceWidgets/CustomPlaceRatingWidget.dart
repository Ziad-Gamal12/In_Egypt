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
    return Row(
      children: [
        CustomRatingStarsRow(rating: rating),
        SizedBox(width: 5),
        Text(
          "$rating",
          style: AppTextStyles(
            context,
          ).medium12.copyWith(color: ratingColor ?? Colors.black),
        ),
      ],
    );
  }
}
