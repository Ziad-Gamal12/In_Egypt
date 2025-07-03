import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCheckBox.dart';

class CustomRemmberMeWidget extends StatefulWidget {
  const CustomRemmberMeWidget({super.key});

  @override
  State<CustomRemmberMeWidget> createState() => _CustomRemmberMeWidgetState();
}

class _CustomRemmberMeWidgetState extends State<CustomRemmberMeWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Customcheckbox(
          onChanged: (value) {
            isChecked = value;
            setState(() {});
          },
        ),
        const SizedBox(width: 10),
        Text(
          "تذكرني",
          style: AppTextStyles(context).regular14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
