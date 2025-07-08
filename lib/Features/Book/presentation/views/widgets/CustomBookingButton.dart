import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomBookingButton extends StatelessWidget {
  const CustomBookingButton({
    super.key,
    required this.currentIndex,
    required this.formKey,
    required this.onPressed,
  });

  final ValueNotifier<int> currentIndex;
  final GlobalKey<FormState> formKey;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Custombutton(
        text: currentIndex.value != 2 ? "التالي" : "تأكيد الحجز",
        color: kMainColor,
        textColor: Colors.white,
        onPressed: () {
          onPressed();
        });
  }
}
