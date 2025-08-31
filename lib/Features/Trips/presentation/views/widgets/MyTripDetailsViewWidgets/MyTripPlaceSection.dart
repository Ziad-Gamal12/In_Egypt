import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/MyTripPlaceDetails.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class MyTripPlaceSection extends StatelessWidget {
  final PlaceEntity? place;

  const MyTripPlaceSection({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("المكان المحجوز",
            style: AppTextStyles(context)
                .semiBold20
                .copyWith(color: Colors.black)),
        const SizedBox(height: 10),
        MyTripPlaceDetails(place: place),
      ],
    );
  }
}
