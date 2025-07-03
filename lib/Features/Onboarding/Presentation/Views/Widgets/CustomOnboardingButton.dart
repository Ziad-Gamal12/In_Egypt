// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomOnboardingButton extends StatefulWidget {
  const CustomOnboardingButton({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CustomOnboardingButton> createState() => _CustomOnboardingButtonState();
}

class _CustomOnboardingButtonState extends State<CustomOnboardingButton> {
  int currentPage = 0;
  @override
  void initState() {
    widget.pageController.addListener(() {
      setState(() {
        currentPage = widget.pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Custombutton(
      text: currentPage != 2 ? "التالي" : "بدأ المغامرة",
      color: kMainColor,
      textColor: Colors.black,
      onPressed: () async {
        if (currentPage != 2) {
          widget.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          await shared_preferences_Services.boolSetter(
            key: Backendkeys.isOnboardingSeen,
            value: true,
          );
          if (!mounted) {
            return;
          } else {
            GoRouter.of(context).go(SignInView.routeName);
          }
        }
      },
    ).animate().moveY(begin: 100, duration: 500.ms).fadeIn(duration: 500.ms);
  }
}
