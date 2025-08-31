import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/BookingDateDetailsSection.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/BookingInfoCard.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/MyTripPlaceSection.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/PaymentDetailsSection.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripDetailsViewWidgets/SectionDivider.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';

class MyTripDetailsViewBody extends StatelessWidget {
  const MyTripDetailsViewBody({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingInfoCard(bookingEntity: bookingEntity),
          const SectionDivider(),
          MyTripPlaceSection(place: bookingEntity.place),
          const SectionDivider(),
          BookingDateDetailsSection(bookingEntity: bookingEntity),
          const SectionDivider(),
          PaymentDetailsSection(bookingEntity: bookingEntity),
        ],
      ),
    );
  }
}
