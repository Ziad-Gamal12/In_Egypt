import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomRatingStarsRow.dart';
import 'package:svg_flutter/svg.dart';

class CustomFavouritePlaceItemDetails extends StatelessWidget {
  const CustomFavouritePlaceItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.assetsIconsLocationIcon),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "الجيزه, مصر",
                  style: AppTextStyles(context)
                      .medium12
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CustomRatingStarsRow(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "4.5",
                  style: AppTextStyles(context)
                      .medium12
                      .copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
