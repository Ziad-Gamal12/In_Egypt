// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, required this.controller, this.hintText});
  String? hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? "ابحث عن ...",
        hintStyle: AppTextStyles(
          context,
        ).regular14.copyWith(color: const Color(0xffBABABA)),
        suffixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: isDark ? Colors.grey : Colors.black,
        ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        filled: true,
        focusColor: isDark ? Colors.grey[850] : Colors.white,
        fillColor: isDark ? Colors.grey[850] : Color(0xffF5F5F5),
      ),
    );
  }
}
