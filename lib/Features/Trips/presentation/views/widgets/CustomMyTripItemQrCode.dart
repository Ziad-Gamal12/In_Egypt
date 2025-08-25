import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomMyTripItemQrCode extends StatelessWidget {
  const CustomMyTripItemQrCode({
    super.key,
    required this.qrCodeUrl,
  });

  final String qrCodeUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1, child: CustomCachedNetworkImage(imageUrl: qrCodeUrl));
  }
}
