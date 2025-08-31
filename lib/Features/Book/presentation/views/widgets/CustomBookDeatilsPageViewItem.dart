import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookDateSelector.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookTextFieldsSection.dart';

class CustomBookDeatilsPageViewItem extends StatelessWidget {
  const CustomBookDeatilsPageViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookTextFieldsSection(),
        SizedBox(
          height: 20,
        ),
        CustomBookDateSelector()
      ],
    );
  }
}
