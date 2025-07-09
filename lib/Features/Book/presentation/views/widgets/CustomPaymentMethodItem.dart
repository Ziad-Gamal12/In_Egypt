import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade50,
              blurRadius: 50,
              spreadRadius: 1,
              offset: const Offset(5, 15),
            )
          ],
          border: Border.all(
              color: isSelected ? Colors.green : Colors.grey, width: 2),
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
          ),
          Spacer(),
          Visibility(
            visible: isSelected,
            child: Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.green,
            ),
          )
        ]));
  }
}
