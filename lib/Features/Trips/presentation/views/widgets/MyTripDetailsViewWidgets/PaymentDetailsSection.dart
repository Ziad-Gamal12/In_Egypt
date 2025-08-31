import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class PaymentDetailsSection extends StatelessWidget {
  final BookingEntity bookingEntity;

  const PaymentDetailsSection({super.key, required this.bookingEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("تفاصيل الدفع",
            style: AppTextStyles(context)
                .semiBold20
                .copyWith(color: Colors.black)),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.people, color: Colors.black),
          title: Text(
            "عدد الأفراد:  ${bookingEntity.numberOfGuests} فرد",
            style:
                AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.attach_money, color: Colors.black),
          title: Text(
            "السعر:  ${bookingEntity.totalPrice} جنيه",
            style:
                AppTextStyles(context).semiBold16.copyWith(color: Colors.red),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
