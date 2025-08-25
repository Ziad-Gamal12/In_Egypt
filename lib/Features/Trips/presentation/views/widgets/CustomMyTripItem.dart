import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomMyTripItem extends StatelessWidget {
  const CustomMyTripItem({super.key, required this.trip});
  final BookingEntity trip;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 325 / 168,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.place?.name ?? "غير معروف",
                      style: AppTextStyles(context)
                          .semiBold20
                          .copyWith(color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      "${trip.place?.ticketPrice ?? 0} جنيه",
                      style: AppTextStyles(context)
                          .regular16
                          .copyWith(color: Colors.red),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                          style: AppTextStyles(context)
                              .regular16
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getDateStatus(trip),
                          style: AppTextStyles(context)
                              .regular16
                              .copyWith(color: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: getBookingStatusBadgeColor(trip),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        getBookingStatus(trip),
                        style: AppTextStyles(context)
                            .regular16
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: AspectRatio(
                      aspectRatio: 1,
                      child:
                          CustomCachedNetworkImage(imageUrl: trip.qrCodeUrl)))
            ],
          ),
        ));
  }

  String getBookingStatus(BookingEntity booking) {
    switch (booking.status) {
      case "pending":
        return "قيد الانتظار";
      case "approved":
        return "مقبول";
      case "rejected":
        return "مرفوض";
      case "canceled":
        return "ملغي";
      default:
        return "غير معروف";
    }
  }

  Color getBookingStatusBadgeColor(BookingEntity booking) {
    switch (booking.status) {
      case "pending":
        return Colors.yellow;
      case "approved":
        return Colors.green;
      case "rejected":
        return Colors.red;
      case "canceled":
        return Colors.red;
      default:
        return Colors.grey;
    }
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
