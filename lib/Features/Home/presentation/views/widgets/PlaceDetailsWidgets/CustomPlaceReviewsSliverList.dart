import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomReviewItem.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/widgets/CustomNoReviewsWidget.dart';

class CustomPlaceReviewsSliverList extends StatelessWidget {
  const CustomPlaceReviewsSliverList({super.key, required this.reviews});
  final List<PlaceReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .2,
              child: CustomNoReviewsWidget()),
        ),
      );
    }
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
