// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/OnBoardingView.dart';
import 'package:in_egypt/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';
import 'package:in_egypt/core/widgets/CustomAppLogoWidget.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomAppLogoWidget()],
      ),
    );
  }

  void initNavigation(BuildContext context) async {
    bool isOnboardingSeen = shared_preferences_Services.boolgetter(
      key: Backendkeys.isOnboardingSeen,
    );
    bool isSignedIn = await firebaseAuthService().isLoggedIn();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) {
        return;
      } else {
        GoRouter.of(context).go(OnBoardingView.routeName);

        // if (isOnboardingSeen) {
        //   if (isSignedIn) {
        //     GoRouter.of(context).go(HomeView.routeName);
        //   } else {
        //     GoRouter.of(context).go(SignInView.routeName);
        //   }
        // } else {
        //   GoRouter.of(context).go(OnBoardingView.routeName);
        // }
      }
    });
  }
}
