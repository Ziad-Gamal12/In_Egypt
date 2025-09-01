import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';

class CustomProfilePictureBackGround extends StatelessWidget {
  const CustomProfilePictureBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        Assets.assetsImagesProfileBackGroudImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
