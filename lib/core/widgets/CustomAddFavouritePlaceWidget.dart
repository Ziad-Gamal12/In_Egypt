import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomAddFavouritePlaceWidget extends StatelessWidget {
  const CustomAddFavouritePlaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: SvgPicture.asset(Assets.assetsIconsFavouriteIcon),
    );
  }
}
