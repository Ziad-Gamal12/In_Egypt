// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "نسيت كلمة المرور",
        style: AppTextStyles(context).regular14.copyWith(color: Colors.grey),
      ),
    );
  }
}
