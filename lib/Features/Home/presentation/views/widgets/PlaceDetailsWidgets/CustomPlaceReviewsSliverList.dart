import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomReviewItem.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';

class CustomPlaceReviewsSliverList extends StatelessWidget {
  const CustomPlaceReviewsSliverList({super.key, required this.reviews});
  final List<PlaceReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty)
      return SliverToBoxAdapter(
          child: EmptyWidget(
        message: "لا يوجد تقييمات",
      ));
    return SliverList.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CustomReviewItem(
          placeReviewEntity: reviews[index],
        ),
      ),
    );
  }
}
