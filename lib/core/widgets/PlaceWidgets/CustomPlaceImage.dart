import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CustomCachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
