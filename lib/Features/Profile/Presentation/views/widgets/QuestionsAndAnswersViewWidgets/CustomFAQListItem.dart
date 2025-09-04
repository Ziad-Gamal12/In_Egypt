import 'dart:math' as math;

import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Domain/Entities/FAQEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomFAQListItem extends StatelessWidget {
  const CustomFAQListItem({super.key, required this.faqEntity});
  final FAQEntity faqEntity;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ExpansionWidget(
        initiallyExpanded: false,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Container(
                color: isDark ? Colors.grey[900] : Colors.grey.shade100,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(faqEntity.question,
                              style: AppTextStyles(context).semiBold16.copyWith(
                                  color: isDark
                                      ? Colors.grey.shade300
                                      : Colors.black))),
                      Transform.rotate(
                        angle: math.pi * animationValue / 2,
                        alignment: Alignment.center,
                        child: Icon(Icons.arrow_right, size: 40),
                      )
                    ],
                  ),
                ),
              ));
        },
        content: Container(
          width: double.infinity,
          color: isDark ? Colors.grey[800] : Colors.grey.shade100,
          padding: EdgeInsets.all(20),
          child: Text(faqEntity.answer,
              style: AppTextStyles(context).regular13.copyWith(
                  color: isDark ? Colors.grey.shade300 : Colors.black)),
        ));
  }
}
