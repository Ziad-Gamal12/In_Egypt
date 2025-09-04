import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/QuestionsAndAnswersViewWidgets/QuestionsAndAnswersViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class QuestionsAndAnswersView extends StatelessWidget {
  const QuestionsAndAnswersView({super.key});
  static const String routeName = '/QuestionsAndAnswersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "اسئلة وجوابات"),
      body: QuestionsAndAnswersViewBody(),
    );
  }
}
