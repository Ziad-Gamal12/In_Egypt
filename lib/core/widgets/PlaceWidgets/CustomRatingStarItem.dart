// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomRatingStarItem extends StatelessWidget {
  const CustomRatingStarItem({super.key, required this.isFilled});
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return !isFilled
        ? Icon(Icons.star_rate_rounded,
            color: isDark ? Colors.grey : Colors.grey.shade300)
        : const Icon(Icons.star_rate_rounded, color: Colors.amber);
  }
}
