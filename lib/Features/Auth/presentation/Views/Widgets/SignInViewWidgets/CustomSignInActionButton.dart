import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomSignInActionButton extends StatelessWidget {
  const CustomSignInActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Custombutton(
      text: "تسجيل الدخول",
      color: kMainColor,
      textColor: Colors.black,
      onPressed: () {},
    );
  }
}
