import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Onboarding/Domain/Entities/OnBoardingPageViewItemEntity.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/CustomOnBoardingSkipText.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/CustomOnboardingButton.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/Widgets/OnboardingPageViewItem.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController onboardingPageController;
  @override
  void initState() {
    super.initState();
    onboardingPageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    onboardingPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: onboardingPageController,
            itemCount: OnBoardingPageViewItemEntity.toList().length,
            itemBuilder: (context, index) => OnBoardingPageViewItem(
              entity: OnBoardingPageViewItemEntity.toList()[index],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 16,
          left: 16,
          child: CustomOnboardingButton(
            pageController: onboardingPageController,
          ),
        ),
        Positioned(top: 20, child: CustomOnBoardingSkipText()),
      ],
    );
  }
}
