import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class SignUpPhoneField extends StatelessWidget {
  const SignUpPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Customteaxtfield(
      labelText: "رقم الهاتف",
      obscureText: false,
      textInputType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال رقم الهاتف';
        }
        return null;
      },
    );
  }
}
