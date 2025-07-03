import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInViewBody.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInViewBody());
  }
}
