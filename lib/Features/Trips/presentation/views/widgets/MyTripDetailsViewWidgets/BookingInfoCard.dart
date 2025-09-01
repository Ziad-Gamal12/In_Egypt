import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookedSuccessViewWidgets/CustomQrCode.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItemStatus.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class BookingInfoCard extends StatelessWidget {
  const BookingInfoCard({
    super.key,
    required this.bookingEntity,
  });

  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الرقم التعريفي:  ${bookingEntity.id}",
                    style: AppTextStyles(context).regular16.copyWith(
                        color: isDark == true ? Colors.white : Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "تاريخ الحجز:  ${bookingEntity.createdAt.day}/${bookingEntity.createdAt.month}/${bookingEntity.createdAt.year}",
                    style: AppTextStyles(context).regular16.copyWith(
                        color: isDark == true ? Colors.white : Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  CustomMyTripItemStatus(status: bookingEntity.status),
                ],
              )),
          Expanded(child: CustomQrCode(qrCodeUrl: bookingEntity.qrCodeUrl))
        ],
      ),
    );
  }
}
