import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/CustomPasswordVisibleIcon.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class SignUpConfirmPasswordField extends StatelessWidget {
  final bool isVisible;
  final Function(bool) onVisibilityChanged;

  const SignUpConfirmPasswordField({
    super.key,
    required this.isVisible,
    required this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Customteaxtfield(
      labelText: "تاكيد كلمة المرور",
      obscureText: !isVisible,
      textInputType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      suffixIcon: Custompasswordvisibleicon(
        visibilityChanged: onVisibilityChanged,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال كلمة المرور';
        }
        return null;
      },
    );
  }
}
