import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class SignUpNameFields extends StatelessWidget {
  const SignUpNameFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customteaxtfield(
          labelText: "الأسم الأول",
          obscureText: false,
          textInputType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال الاسم الأول';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        Customteaxtfield(
          labelText: "الأسم الأخير",
          obscureText: false,
          textInputType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال الاسم الأخير';
            }
            return null;
          },
        ),
      ],
    );
  }
}
