import 'package:flutter/material.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomCachedNetworkImage(imageUrl: getUserData().photoUrl),
          ),
        ),
        SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${getUserData().firstName} ${getUserData().lastName}",
                        style: AppTextStyles(context)
                            .semiBold14
                            .copyWith(color: Colors.black),
                      ),
                      const Spacer(),
                      Text(
                        "14/11/2022",
                        style: AppTextStyles(context)
                            .regular14
                            .copyWith(color: Colors.grey),
                      ),
                    ]),
                const SizedBox(
                  height: 5,
                ),
                CustomRatingStarsRow(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "هذا المكان من افضل الامكان التى قمت بزيارتها فى الوقت الحالى",
                    style: AppTextStyles(context)
                        .regular14
                        .copyWith(color: Colors.grey),
                  ),
                )
              ]),
        )
      ],
    );
  }
}
