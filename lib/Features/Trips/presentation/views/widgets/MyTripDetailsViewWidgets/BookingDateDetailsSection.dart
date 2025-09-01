import 'package:flutter/material.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class BookingDateDetailsSection extends StatelessWidget {
  final BookingEntity bookingEntity;

  const BookingDateDetailsSection({super.key, required this.bookingEntity});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("تفاصيل الحجز",
            style: AppTextStyles(context)
                .semiBold20
                .copyWith(color: isDark == true ? Colors.white : Colors.black)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                leading: Icon(Icons.calendar_month_outlined,
                    color: isDark == true ? Colors.grey : Colors.black),
                title: Text("تبدأ",
                    style: AppTextStyles(context).regular14.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
                subtitle: Text(
                    "${bookingEntity.startAt?.day}/${bookingEntity.startAt?.month}/${bookingEntity.startAt?.year}",
                    style: AppTextStyles(context).semiBold12.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Icon(Icons.calendar_month_outlined,
                    color: isDark == true ? Colors.grey : Colors.black),
                title: Text("تنتهي",
                    style: AppTextStyles(context).regular14.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
                subtitle: Text(
                    "${bookingEntity.endAt?.day}/${bookingEntity.endAt?.month}/${bookingEntity.endAt?.year}",
                    style: AppTextStyles(context).semiBold12.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
              ),
            ),
            IntrinsicWidth(
              child: ListTile(
                leading: Icon(Icons.calendar_today,
                    color: isDark == true ? Colors.grey : Colors.black),
                title: Text("الأيام",
                    style: AppTextStyles(context).regular14.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
                subtitle: Text("${bookingEntity.daysDuration}",
                    style: AppTextStyles(context).semiBold12.copyWith(
                        color: isDark == true ? Colors.white : Colors.black)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
