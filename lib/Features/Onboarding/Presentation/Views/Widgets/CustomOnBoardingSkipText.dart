import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomOnBoardingSkipText extends StatefulWidget {
  const CustomOnBoardingSkipText({super.key});

  @override
  State<CustomOnBoardingSkipText> createState() =>
      _CustomOnBoardingSkipTextState();
}

class _CustomOnBoardingSkipTextState extends State<CustomOnBoardingSkipText> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () async {
          await shared_preferences_Services.boolSetter(
            key: Backendkeys.isOnboardingSeen,
            value: true,
          );
          if (!mounted) {
            return;
          } else {
            // ignore: use_build_context_synchronously
            GoRouter.of(context).go(SignInView.routeName);
          }
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 30,
            top: 10,
            bottom: 10,
            right: 30,
          ),
          child: Text(
            "تخط",
            style: AppTextStyles(
              context,
            ).regular16.copyWith(color: Colors.white),
          ),
        ).asGlass(
          clipBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
