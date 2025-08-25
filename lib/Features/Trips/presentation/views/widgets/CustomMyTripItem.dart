import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItemDateRow.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItemQrCode.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItemStatus.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

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
                    CustomMyTripItemDateRow(trip: trip),
                    SizedBox(
                      height: 10,
                    ),
                    CustomMyTripItemStatus(status: trip.status),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: CustomMyTripItemQrCode(qrCodeUrl: trip.qrCodeUrl))
            ],
          ),
        ));
  }
}
