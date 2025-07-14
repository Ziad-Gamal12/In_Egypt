import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:provider/provider.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = context.read<UserEntity>();

    return CustomEmailTextField(onSaved: (val) {
      userEntity.email = val ?? '';
    });
  }
}
