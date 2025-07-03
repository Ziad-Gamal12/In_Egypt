import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomRemmberMeWidget.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSeperatedWidget.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSignInActionButton.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CutomSignUpNavigationButton.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/ForgetPasswordText.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInTextFields.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SigninSocialButtons.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomAppLogoWidget.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding,
          vertical: kVerticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: CustomAppLogoWidget(),
            ),
            Spacer(),
            SignInTextFields(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CustomRemmberMeWidget(), ForgetPasswordText()],
            ),
            SizedBox(height: 40),
            CutomSignUpNavigationButton(),
            SizedBox(height: 20),
            CustomSignInActionButton(),
            SizedBox(height: 20),
            CustomSeperatedWidget(),
            SizedBox(height: 20),
            SigninSocialButtons(),
          ],
        ),
      ),
    );
  }
}
