// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';

class CustomPlaceVerticalDesignItemContent extends StatelessWidget {
  const CustomPlaceVerticalDesignItemContent({
    super.key,
    required this.place,
  });

  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomCachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: place.images.isNotEmpty ? place.images[0] : '',
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomPlaceItemInfo(place: place),
      ],
    );
  }
}
