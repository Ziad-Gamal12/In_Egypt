import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomMyTripItemDateRow extends StatelessWidget {
  const CustomMyTripItemDateRow({super.key, required this.trip});
  final BookingEntity trip;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.solidCalendarCheck,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${trip.startAt?.day}/${trip.startAt?.month}/${trip.startAt?.year}",
          style: AppTextStyles(context).regular16.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          getDateStatus(trip),
          style: AppTextStyles(context).regular16.copyWith(color: Colors.red),
        )
      ],
    );
  }

  String getDateStatus(BookingEntity booking) {
    if (booking.startAt != null) {
      if (booking.startAt!.isBefore(DateTime.now()) &&
          booking.endAt!.isBefore(DateTime.now())) {
        return "(منتهية)";
      } else if (booking.startAt!.isBefore(DateTime.now()) &&
          booking.endAt!.isAfter(DateTime.now())) {
        return "(جاريه)";
      } else if (booking.startAt!.isAfter(DateTime.now())) {
        return "(قريبا)";
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
}
