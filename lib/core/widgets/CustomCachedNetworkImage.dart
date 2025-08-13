import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({super.key, required this.imageUrl, this.fit});
  final String imageUrl;
  BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      errorWidget: (context, url, error) {
        return const Icon(
          Icons.error,
          color: Colors.red,
        );
      },
    );
  }
}
