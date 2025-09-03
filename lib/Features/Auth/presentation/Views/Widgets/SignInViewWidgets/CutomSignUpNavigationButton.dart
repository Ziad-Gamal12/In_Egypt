// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignUpView.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CutomSignUpNavigationButton extends StatelessWidget {
  const CutomSignUpNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Custombutton(
      text: "انشاء حساب",
      color: isDark ? Colors.grey.shade900 : Colors.white,
      textColor: isDark ? Colors.grey.shade300 : Colors.black,
      onPressed: () {
        GoRouter.of(context).push(SignUpView.routeName);
      },
      side: BorderSide(color: Colors.grey),
    );
  }
}
