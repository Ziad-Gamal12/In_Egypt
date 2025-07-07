import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomPopularPlacesHeader extends StatelessWidget {
  const CustomPopularPlacesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "اشهر الأماكن",
          style:
              AppTextStyles(context).semiBold20.copyWith(color: Colors.black),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "المزيد",
            style:
                AppTextStyles(context).regular14.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
