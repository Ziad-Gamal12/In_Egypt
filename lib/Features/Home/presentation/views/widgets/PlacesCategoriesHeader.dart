import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class PlacesCategoriesHeader extends StatelessWidget {
  const PlacesCategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "أحدث الفئات",
      style: AppTextStyles(context).semiBold20.copyWith(color: Colors.black),
    );
  }
}
