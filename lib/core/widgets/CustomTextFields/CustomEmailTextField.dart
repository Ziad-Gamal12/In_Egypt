// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class CustomEmailTextField extends StatelessWidget {
  CustomEmailTextField({super.key, required this.controller, this.onSaved});
  final TextEditingController controller;
  ValueChanged<String?>? onSaved;
  @override
  Widget build(BuildContext context) {
    return Customteaxtfield(
        controller: controller,
        labelText: "البريد الإلكتروني",
        prefixIcon: FontAwesomeIcons.envelope,
        onSaved: onSaved,
        obscureText: false,
        textInputType: TextInputType.emailAddress,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'الرجاء إدخال البريد الإلكتروني';
          } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val)) {
            return 'الرجاء إدخال بريد إلكتروني صالح';
          }
          return null;
        });
  }
}
