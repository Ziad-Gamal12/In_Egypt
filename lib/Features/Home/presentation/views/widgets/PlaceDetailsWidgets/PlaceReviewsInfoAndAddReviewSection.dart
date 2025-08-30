import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AddReviewSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceReviewsSectionHeader.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class PlaceReviewsInfoAndAddReviewSection extends StatefulWidget {
  const PlaceReviewsInfoAndAddReviewSection({super.key, required this.place});
  final PlaceEntity place;

  @override
  State<PlaceReviewsInfoAndAddReviewSection> createState() =>
      _PlaceReviewsInfoAndAddReviewSectionState();
}

class _PlaceReviewsInfoAndAddReviewSectionState
    extends State<PlaceReviewsInfoAndAddReviewSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPlaceReviewsSectionHeader(
          rating: widget.place.rating,
        ),
        const SizedBox(
          height: 10,
        ),
        AddReviewSection(
          placeId: widget.place.id,
        )
      ],
    );
  }
}
