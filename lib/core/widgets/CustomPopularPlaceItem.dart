import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomPopularPlaceImage.dart';
import 'package:in_egypt/core/widgets/CustomPopularPlaceInfo.dart';

class CustomPopularPlaceItem extends StatelessWidget {
  const CustomPopularPlaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 315 / 155,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffF3F3F3), width: 1)),
        child: Row(
          children: [
            Expanded(flex: 86, child: CustomPopularPlaceImage()),
            SizedBox(
              width: 14,
            ),
            Expanded(flex: 179, child: CusCustomPopularPlaceInfo())
          ],
        ),
      ),
    );
  }
}
