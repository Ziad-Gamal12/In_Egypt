import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/PersonalDetailsView.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/QuestionsAndAnswersView.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileActionButton.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileDarkModeActionButton.dart';

class CustomProfileActionButtons extends StatelessWidget {
  const CustomProfileActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileActionButton(
          onTap: () {
            GoRouter.of(context).push(PersonalDetailsView.routeName);
          },
          title: "المعلومات الشخصية",
          iconData: Icons.account_circle,
        ),
        SizedBox(
          height: 30,
        ),
        CustomProfileDarkModeActionButton(),
        SizedBox(
          height: 30,
        ),
        CustomProfileActionButton(
          onTap: () {
            GoRouter.of(context).push(QuestionsAndAnswersView.routeName);
          },
          title: "أسئلة و أجوبة",
          iconData: Icons.contact_support,
        ),
        SizedBox(
          height: 30,
        ),
        CustomProfileActionButton(
          title: "من نحن",
          iconData: Icons.info,
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
