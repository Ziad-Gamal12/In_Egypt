// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class EmptyWidget extends StatelessWidget {
  EmptyWidget({super.key, this.message});
  String? message;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 200),
        Image.asset(
          Assets.assetsIconsEmptyIcon,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Text(
          message ?? "لا يوجد شيء",
          textAlign: TextAlign.center,
          style: AppTextStyles(
            context,
          )
              .semiBold20
              .copyWith(color: isDark ? Colors.grey.shade300 : Colors.black),
        ),
      ],
    );
  }
}
