// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomPlaceLocationWidget extends StatelessWidget {
  const CustomPlaceLocationWidget({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Assets.assetsIconsLocationIcon,
          height: 20,
          width: 20,
          color: Colors.black,
        ),
        SizedBox(width: 5),
        Text(
          location,
          style: AppTextStyles(context).medium12.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
