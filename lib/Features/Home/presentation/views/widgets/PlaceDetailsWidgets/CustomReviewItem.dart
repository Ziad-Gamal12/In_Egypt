import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key, required this.placeReviewEntity});
  final PlaceReviewEntity placeReviewEntity;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomCachedNetworkImage(
                imageUrl: placeReviewEntity.user.photoUrl),
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
                        "${placeReviewEntity.user.firstName} ${placeReviewEntity.user.lastName}",
                        style: AppTextStyles(context).semiBold14.copyWith(
                            color:
                                isDark == true ? Colors.white : Colors.black),
                      ),
                      const Spacer(),
                      Text(
                        "${placeReviewEntity.createdAt.day}/${placeReviewEntity.createdAt.month}/${placeReviewEntity.createdAt.year}",
                        style: AppTextStyles(context)
                            .regular14
                            .copyWith(color: Colors.grey),
                      ),
                    ]),
                const SizedBox(
                  height: 5,
                ),
                CustomRatingStarsRow(
                  rating: placeReviewEntity.rating,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    placeReviewEntity.review,
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
