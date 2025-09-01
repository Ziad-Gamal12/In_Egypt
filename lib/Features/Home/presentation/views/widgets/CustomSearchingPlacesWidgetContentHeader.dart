import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomSearchingPlacesWidgetContentHeader extends StatelessWidget {
  const CustomSearchingPlacesWidgetContentHeader({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Text.rich(
      TextSpan(
          text: "تم العثور على ",
          style: AppTextStyles(context)
              .regular14
              .copyWith(color: isDark == true ? Colors.white : Colors.black),
          children: [
            TextSpan(
              text: " $count ",
              style:
                  AppTextStyles(context).semiBold14.copyWith(color: Colors.red),
            ),
            TextSpan(
              text: "مكان ",
              style: AppTextStyles(context).regular14.copyWith(
                  color: isDark == true ? Colors.white : Colors.black),
            ),
          ]),
    );
  }
}
