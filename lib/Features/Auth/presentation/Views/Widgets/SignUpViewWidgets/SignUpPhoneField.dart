import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';
import 'package:provider/provider.dart';

class SignUpPhoneField extends StatelessWidget {
  const SignUpPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = context.read<UserEntity>();

    return Customteaxtfield(
      labelText: "رقم الهاتف",
      obscureText: false,
      textInputType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (val) {
        userEntity.phoneNumber = val ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال رقم الهاتف';
        }
        return null;
      },
    );
  }
}
