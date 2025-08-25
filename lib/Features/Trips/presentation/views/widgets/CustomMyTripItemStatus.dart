import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomMyTripItemStatus extends StatelessWidget {
  const CustomMyTripItemStatus({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: getBookingStatusBadgeColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        getBookingStatus(),
        style: AppTextStyles(context)
            .regular16
            .copyWith(color: getBookingStatusTextColor()),
      ),
    );
  }

  String getBookingStatus() {
    switch (status) {
      case "pending":
        return "قيد الانتظار";
      case "confirmed":
        return "مقبول";
      case "rejected":
        return "مرفوض";
      case "canceled":
        return "ملغي";
      default:
        return "غير معروف";
    }
  }

  Color getBookingStatusBadgeColor() {
    switch (status) {
      case "pending":
        return Colors.yellow;
      case "confirmed":
        return Colors.green;
      case "rejected":
        return Colors.red;
      case "canceled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color getBookingStatusTextColor() {
    switch (status) {
      case "pending":
        return Colors.black;
      case "confirmed":
        return Colors.black;
      case "rejected":
        return Colors.white;
      case "canceled":
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}
