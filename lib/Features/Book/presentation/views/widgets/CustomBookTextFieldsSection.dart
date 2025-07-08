import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class CustomBookTextFieldsSection extends StatelessWidget {
  const CustomBookTextFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customteaxtfield(
            labelText: "أسم المسؤول",
            prefixIcon: FontAwesomeIcons.user,
            obscureText: false,
            textInputType: TextInputType.name,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال اسم المسؤول';
              }
              return null;
            }),
        SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            labelText: "البريد الإلكتروني",
            prefixIcon: FontAwesomeIcons.envelope,
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
            }),
        SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            labelText: "رقم الهاتف",
            obscureText: false,
            textInputType: TextInputType.phone,
            prefixIcon: FontAwesomeIcons.phone,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              } else if (val.length < 11) {
                return 'الرجاء إدخال رقم هاتف صالح';
              }
              return null;
            }),
        SizedBox(
          height: 20,
        ),
        Customteaxtfield(
            labelText: "عدد الافراد",
            prefixIcon: FontAwesomeIcons.users,
            obscureText: false,
            textInputType: TextInputType.number,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'الرجاء إدخال عدد الافراد';
              }
              return null;
            }),
      ],
    );
  }
}
