// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCheckBox.dart';

class SignUpAgreementRow extends StatelessWidget {
  const SignUpAgreementRow({super.key, required this.onChanged});
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Customcheckbox(
          onChanged: (value) {
            onChanged(value);
          },
        ),
        const SizedBox(width: 10),
        Text.rich(
          TextSpan(
            text: "أوافق على ",
            style: AppTextStyles(
              context,
            ).regular14.copyWith(color: Colors.grey),
            children: [
              TextSpan(
                text: "الشروط و الأحكام الخاصة بالتطبيق",
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: kMainColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
