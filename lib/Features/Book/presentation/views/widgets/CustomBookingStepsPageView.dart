import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookDeatilsPageViewItem.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookPaymentPageViewItem.dart';

class CustomBookingStepsPageView extends StatefulWidget {
  const CustomBookingStepsPageView(
      {super.key, required this.currentIndex, required this.rangeChanged});

  final int currentIndex;
  final ValueChanged<DateTimeRange<DateTime>?> rangeChanged;

  @override
  State<CustomBookingStepsPageView> createState() =>
      _CustomBookingStepsPageViewState();
}

class _CustomBookingStepsPageViewState
    extends State<CustomBookingStepsPageView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> stepsWidget = [
      CustomBookDeatilsPageViewItem(
        rangeChanged: widget.rangeChanged,
      ),
      CustomBookPaymentPageViewItem(),
      SizedBox(),
    ];
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stepsWidget.length,
      itemBuilder: (context, index) => stepsWidget[widget.currentIndex],
    );
  }
}
