import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/CustomPasswordVisibleIcon.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

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
  bool ispasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customteaxtfield(
          labelText: "البريد الإلكتروني",
          obscureText: false,
          controller: widget.emailController,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'رجاء إدخال البريد الإلكتروني';
            } else if (!RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            ).hasMatch(value)) {
              return 'رجاء إدخال بريد إلكتروني صحيح';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
        Customteaxtfield(
          suffixIcon: Custompasswordvisibleicon(
            visibilityChanged: (isVisible) {
              setState(() {
                ispasswordVisible = isVisible;
              });
            },
          ),
          labelText: "كلمة المرور",
          obscureText: !ispasswordVisible,
          controller: widget.passwordController,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'رجاء إدخال كلمة المرور';
            }
            return null;
          },
        ),
      ],
    );
  }
}
