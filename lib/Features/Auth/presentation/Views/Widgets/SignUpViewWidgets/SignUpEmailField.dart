import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';
import 'package:provider/provider.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = context.read<UserEntity>();

    return Customteaxtfield(
      labelText: "البريد الإلكتروني",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (val) {
        userEntity.email = val ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال البريد الإلكتروني';
        }
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (!emailRegex.hasMatch(value)) {
          return 'الرجاء إدخال بريد إلكتروني صالح';
        }
        return null;
      },
    );
  }
}
