import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "انشاء حساب"),
      body: SignUpViewBody(),
    );
  }
}
