// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppLogoWidget extends StatelessWidget {
  const CustomAppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AspectRatio(
      aspectRatio: 1,
      child: SvgPicture.asset(isDark
          ? Assets.assetsIconsAppLogoDarkMode
          : Assets.assetsImagesAppLogo),
    );
  }
}
