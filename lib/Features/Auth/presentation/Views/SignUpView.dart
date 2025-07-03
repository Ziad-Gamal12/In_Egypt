import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBody.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpViewBody());
  }
}
