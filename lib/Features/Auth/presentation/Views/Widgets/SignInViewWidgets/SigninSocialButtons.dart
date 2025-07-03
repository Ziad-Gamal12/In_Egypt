// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSocialButton.dart';
import 'package:in_egypt/core/utils/images.dart';

class SigninSocialButtons extends StatelessWidget {
  const SigninSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          text: "تسجيل بواسطة جوجل",
          onPressed: () {},
          iconpath: Assets.assetsIconsGoogleIcon,
        ),
        const SizedBox(height: 16),
        CustomSocialButton(
          text: "تسجيل بواسطة فيسبوك",
          onPressed: () {},
          iconpath: Assets.assetsIconsFacebookIcon,
        ),
      ],
    );
  }
}
