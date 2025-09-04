import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Domain/Entities/FAQEntity.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/QuestionsAndAnswersViewWidgets/CustomFAQListItem.dart';

class CustomFAQListView extends StatefulWidget {
  const CustomFAQListView({super.key});

  @override
  State<CustomFAQListView> createState() => _CustomFAQListViewState();
}

class _CustomFAQListViewState extends State<CustomFAQListView> {
  List<FAQEntity> faqList = FAQEntity.faqList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CustomFAQListItem(
          faqEntity: faqList[index],
        ),
      ),
    );
  }
}
