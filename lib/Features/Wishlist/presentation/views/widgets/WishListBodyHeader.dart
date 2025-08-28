import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class WishListBodyHeader extends StatelessWidget {
  final TextEditingController controller;
  const WishListBodyHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomSearchTextField(controller: controller),
        const SizedBox(height: 40),
      ],
    );
  }
}
