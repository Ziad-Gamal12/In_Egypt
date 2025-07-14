import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class CustomEmailTextField extends StatelessWidget {
  CustomEmailTextField({super.key, this.controller, this.onSaved});
  TextEditingController? controller;
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
