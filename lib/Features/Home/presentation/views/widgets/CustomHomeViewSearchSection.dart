import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class CustomHomeViewSearchSection extends StatelessWidget {
  const CustomHomeViewSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomSearchTextField(
          controller: TextEditingController(),
        )
      ]),
    );
  }
}
