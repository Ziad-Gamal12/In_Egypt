import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/domain/entities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomPaymentMethodItem extends StatelessWidget {
  const CustomPaymentMethodItem(
      {super.key, required this.isSelected, required this.method});
  final bool isSelected;
  final PaymentMethodEntity method;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 50,
              spreadRadius: 1,
              offset: const Offset(5, 15),
            )
          ],
          border: Border.all(
              color: isSelected ? Colors.green : Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Image.asset(method.icon),
          const SizedBox(
            width: 16,
          ),
          Text(
            method.name,
            style:
                AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
          )
        ]));
  }
}
