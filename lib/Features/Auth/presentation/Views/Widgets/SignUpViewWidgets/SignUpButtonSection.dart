import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class SignUpButtonSection extends StatelessWidget {
  const SignUpButtonSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          text: "انشاء حساب",
          color: kMainColor,
          textColor: Colors.black,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            }
          },
        ),
        const SizedBox(height: 20),
        Text(
          "لديك حساب بالفعل؟",
          textAlign: TextAlign.center,
          style: AppTextStyles(context).regular14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
