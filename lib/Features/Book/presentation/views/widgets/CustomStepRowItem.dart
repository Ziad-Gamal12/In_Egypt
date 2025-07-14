import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/domain/entities/CustomBookingStepsEntity.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomStepRowItem extends StatelessWidget {
  const CustomStepRowItem({
    super.key,
    required this.e,
    required this.currentIndex,
  });

  final MapEntry<int, CustomBookingStepsEntity> e;

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentIndex == e.key ? kMainColor : Colors.grey.shade100,
      ),
      child: Text(
        e.value.title,
        style: AppTextStyles(context).regular14,
      ),
    );
  }
}
