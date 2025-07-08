import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceLocationWidget.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomPlaceRatingWidget.dart';

class CustomPlaceItemInfo extends StatelessWidget {
  const CustomPlaceItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أهرامات الجيزة",
              style: AppTextStyles(context)
                  .semiBold20
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            CustomPlaceLocationWidget(),
            SizedBox(
              height: 5,
            ),
            CustomPlaceRatingWidget()
          ],
        ),
      ),
    );
  }
}
