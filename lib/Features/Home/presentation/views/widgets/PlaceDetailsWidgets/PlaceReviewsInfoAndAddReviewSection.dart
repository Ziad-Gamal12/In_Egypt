import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/AddReviewSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceReviewsSectionHeader.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:provider/provider.dart';

class PlaceReviewsInfoAndAddReviewSection extends StatelessWidget {
  const PlaceReviewsInfoAndAddReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPlaceReviewsSectionHeader(
          rating: place.rating,
        ),
        const SizedBox(
          height: 10,
        ),
        AddReviewSection(
          placeId: place.id,
        )
      ],
    );
  }
}
