import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Book/domain/entities/PaymentMethodEntity.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomPaymentMethodItem.dart';
import 'package:in_egypt/constant.dart';

class CustomBookPaymentPageViewItem extends StatefulWidget {
  const CustomBookPaymentPageViewItem({super.key});

  @override
  State<CustomBookPaymentPageViewItem> createState() =>
      _CustomBookPaymentPageViewItemState();
}

class _CustomBookPaymentPageViewItemState
    extends State<CustomBookPaymentPageViewItem> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: Column(
        children: PaymentMethodEntity.paymentMethods
            .asMap()
            .entries
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = e.key;
                    });
                  },
                  child: CustomPaymentMethodItem(
                    method: e.value,
                    isSelected: currentIndex == e.key,
                  ).animate().fadeIn(
                      duration: 600.ms,
                      delay: Duration(milliseconds: e.key * 200)),
                ))
            .toList(),
      ),
    );
  }
}
