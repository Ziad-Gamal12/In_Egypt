import 'package:flutter/material.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomPasswordTextField.dart';

class SignInTextFields extends StatefulWidget {
  const SignInTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<SignInTextFields> createState() => _SignInTextFieldsState();
}

class _SignInTextFieldsState extends State<SignInTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEmailTextField(
          controller: widget.emailController,
          onSaved: (val) {},
        ),
        SizedBox(height: 20),
        CustomPasswordTextField(
          controller: widget.passwordController,
        )
      ],
    );
  }
}
