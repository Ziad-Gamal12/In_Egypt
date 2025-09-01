// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceLocationWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceRatingWidget.dart';

class CustomPlaceItemInfo extends StatelessWidget {
  CustomPlaceItemInfo({super.key, this.titleColor, required this.place});
  Color? titleColor;
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.name,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles(
              context,
            ).semiBold16.copyWith(color: getTitleColor(isDark: isDark)),
          ),
          SizedBox(height: 5),
          CustomPlaceLocationWidget(location: place.location),
          SizedBox(height: 5),
          CustomPlaceRatingWidget(rating: place.rating),
        ],
      ),
    );
  }

  Color getTitleColor({required bool isDark}) {
    if (titleColor != null) {
      return titleColor!;
    } else {
      return isDark ? Colors.white : Colors.black;
    }
  }
}
