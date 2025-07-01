// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/OnBoardingView.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    initNavigation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(Assets.assetsImagesAppLogo),
          ),
        ],
      ),
    );
  }

  void initNavigation(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) {
        return;
      } else {
        GoRouter.of(context).go(OnBoardingView.routeName);
      }
    });
  }
}
