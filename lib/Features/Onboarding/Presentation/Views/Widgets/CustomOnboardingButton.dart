import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/constant.dart';
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
      onPressed: () {
        if (currentPage != 2) {
          widget.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    ).animate().moveY(begin: 100, duration: 500.ms).fadeIn(duration: 500.ms);
  }
}
