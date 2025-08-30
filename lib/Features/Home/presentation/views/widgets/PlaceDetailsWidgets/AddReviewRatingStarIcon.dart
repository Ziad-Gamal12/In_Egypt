import 'package:flutter/material.dart';

class AddReviewRatingStarIcon extends StatelessWidget {
  const AddReviewRatingStarIcon({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_rounded,
      color: isSelected ? Colors.amber : Colors.grey.shade300,
    );
  }
}
