import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfilePictureBackGround.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfilePictureCircleAvatar.dart';

class CustomProfilePicture extends StatelessWidget {
  const CustomProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: CustomProfilePictureBackGround()),
            Positioned(
                left: 0,
                right: 0,
                bottom: -50,
                child: CustomProfilePictureCircleAvatar())
          ],
        ),
      ),
    );
  }
}
