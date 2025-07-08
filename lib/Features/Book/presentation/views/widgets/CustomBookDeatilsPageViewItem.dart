import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookDateSelector.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookTextFieldsSection.dart';

class CustomBookDeatilsPageViewItem extends StatelessWidget {
  const CustomBookDeatilsPageViewItem({
    super.key,
    required this.rangeChanged,
  });
  final ValueChanged<DateTimeRange<DateTime>?> rangeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookTextFieldsSection(),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(FontAwesomeIcons.solidCalendarDays, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
              child: CustomBookDateSelector(
                rangeChanged: rangeChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
