import 'package:flutter/material.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomProfilePictureCircleAvatar extends StatelessWidget {
  const CustomProfilePictureCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Color(0xffce9d63),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(58),
            child: CustomCachedNetworkImage(imageUrl: getUserData().photoUrl),
          ),
        ),
      ),
    );
  }
}
