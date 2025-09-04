import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/QuestionsAndAnswersViewWidgets/CustomFAQListView.dart';
import 'package:in_egypt/constant.dart';

class QuestionsAndAnswersViewBody extends StatelessWidget {
  const QuestionsAndAnswersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: CustomFAQListView(),
    );
  }
}
