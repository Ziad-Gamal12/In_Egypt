import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomPasswordTextField.dart';

class SignUpConfirmPasswordField extends StatelessWidget {
  final TextEditingController confirmPasswordController;
  const SignUpConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPasswordTextField(
      hintOrlabalText: "تاكيد كلمة المرور",
      controller: confirmPasswordController,
    );
  }
}
