import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';

class CustomPopularPlaceImage extends StatelessWidget {
  const CustomPopularPlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 86 / 116,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          Assets.assetsImagesTestFavouritePlaceItemBackGround,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
