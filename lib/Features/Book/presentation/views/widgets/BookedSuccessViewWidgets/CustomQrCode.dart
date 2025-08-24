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
    return Row(
      children: [
        Spacer(),
        Expanded(flex: 2, child: CustomCachedNetworkImage(imageUrl: qrCodeUrl)),
        Spacer(),
      ],
    );
  }
}
