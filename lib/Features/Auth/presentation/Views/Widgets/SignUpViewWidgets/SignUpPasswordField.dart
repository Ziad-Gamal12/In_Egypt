import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomPasswordTextField.dart';

class SignUpPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  const SignUpPasswordField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPasswordTextField(
      controller: passwordController,
    );
  }
}
