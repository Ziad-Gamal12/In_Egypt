import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomQrCode extends StatelessWidget {
  const CustomQrCode({
    super.key,
    required this.qrCodeUrl,
  });

  final String qrCodeUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * .5,
        child: CustomCachedNetworkImage(imageUrl: qrCodeUrl));
  }
}
