import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpAgreementRow.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpButtonSection.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpConfirmPasswordField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpEmailField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpNameFields.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPasswordField.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPhoneField.dart';
import 'package:in_egypt/constant.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SignUpNameFields(),
            const SizedBox(height: 20),
            const SignUpEmailField(),
            const SizedBox(height: 20),
            const SignUpPhoneField(),
            const SizedBox(height: 20),
            SignUpPasswordField(
              isVisible: isPasswordVisible,
              onVisibilityChanged: (val) {
                setState(() => isPasswordVisible = val);
              },
            ),
            const SizedBox(height: 20),
            SignUpConfirmPasswordField(
              isVisible: isConfirmPasswordVisible,
              onVisibilityChanged: (val) {
                setState(() => isConfirmPasswordVisible = val);
              },
            ),
            const SizedBox(height: 20),
            const SignUpAgreementRow(),
            const Spacer(),
            SignUpButtonSection(formKey: formKey),
          ],
        ),
      ),
    );
  }
}
