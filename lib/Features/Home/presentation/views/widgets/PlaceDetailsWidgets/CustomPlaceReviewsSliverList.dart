import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomReviewItem.dart';

class CustomPlaceReviewsSliverList extends StatelessWidget {
  const CustomPlaceReviewsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CustomReviewItem(),
      ),
    );
  }
}
