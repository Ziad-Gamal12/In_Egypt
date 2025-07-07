import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomAddFavouritePlaceWidget.dart';
import 'package:in_egypt/core/widgets/CustomRatingStarsRow.dart';

class CusCustomPopularPlaceInfo extends StatelessWidget {
  const CusCustomPopularPlaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أهرامات الجيزة",
              style: AppTextStyles(context)
                  .semiBold16
                  .copyWith(color: Colors.black),
            ),
            Spacer(),
            CustomAddFavouritePlaceWidget(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "\$245,00",
          style: AppTextStyles(context).semiBold14.copyWith(color: Colors.red),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRatingStarsRow(),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.8",
              style: AppTextStyles(context)
                  .semiBold12
                  .copyWith(color: Colors.black),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          " الأهرامات المصرية هي هياكل حجرية قديمة تقع في مصر. تم بناء معظمها كمقابر لـ الفراعنة وزوجاتهم خلال قديم و المملكة الوسطى فترات.[1][2][3] تم التعرف على ما لا يقل عن 138 الأهرامات تم اكتشافها في مصر.[4][5] تقريبًا 80 هرمًا تم بناؤها داخل مملكة كوش، تقع الآن في دولة حديثة السودان.",
          style: AppTextStyles(context).regular13.copyWith(color: Colors.grey),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
