import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/CustomPasswordVisibleIcon.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class SignUpPasswordField extends StatelessWidget {
  final bool isVisible;
  final Function(bool) onVisibilityChanged;
  final TextEditingController passwordController;
  const SignUpPasswordField({
    super.key,
    required this.isVisible,
    required this.onVisibilityChanged,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Customteaxtfield(
      labelText: "كلمة المرور",
      obscureText: !isVisible,
      controller: passwordController,
      textInputType: TextInputType.visiblePassword,
      suffixIcon: Custompasswordvisibleicon(
        visibilityChanged: onVisibilityChanged,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال كلمة المرور';
        } else if (value.length < 8) {
          return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        }
        return null;
      },
    );
  }
}
