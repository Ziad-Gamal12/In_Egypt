import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class EmptyWidget extends StatelessWidget {
  EmptyWidget({super.key, this.message});
  String? message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Image.asset(
          Assets.assetsIconsEmptyIcon,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(
          message ?? "لا يوجد شيء",
          textAlign: TextAlign.center,
          style: AppTextStyles(
            context,
          ).semiBold20.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
