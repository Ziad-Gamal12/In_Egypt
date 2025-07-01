import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/OnBoardingViewBody.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = '/OnBoardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingViewBody());
  }
}
