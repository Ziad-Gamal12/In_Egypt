import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomBookDateSelector extends StatefulWidget {
  const CustomBookDateSelector({super.key, required this.rangeChanged});
  final ValueChanged<DateTimeRange<DateTime>?> rangeChanged;

  @override
  State<CustomBookDateSelector> createState() => _CustomBookDateSelectorState();
}

class _CustomBookDateSelectorState extends State<CustomBookDateSelector> {
  DateTimeRange<DateTime>? range;
  showDateRangePicker() async {
    TextStyle customTextStyle =
        AppTextStyles(context).semiBold16.copyWith(color: Colors.black);
    range = await showRangePickerDialog(
      context: context,
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      width: double.infinity,
      selectedCellsTextStyle: customTextStyle,
      currentDateTextStyle: customTextStyle,
      enabledCellsTextStyle: customTextStyle,
      leadingDateTextStyle: customTextStyle,
      singleSelectedCellTextStyle: customTextStyle,
      padding: EdgeInsets.all(16),
      currentDateDecoration: BoxDecoration(
        color: Color(0xffFCD240),
        shape: BoxShape.circle,
      ),
      selectedCellsDecoration: BoxDecoration(
        color: Color(0xffFEF9D8),
      ),
      singleSelectedCellDecoration: BoxDecoration(
        color: Color(0xffFCD240),
        shape: BoxShape.circle,
      ),
      splashColor: Colors.transparent,
      initialPickerType: PickerType.days,
      slidersColor: Colors.black,
      centerLeadingDate: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDateRangePicker();
        widget.rangeChanged(range);
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: range != null ? kMainColor : Color(0xffF3F3F3),
                width: 2)),
        child: Text(
          range == null
              ? "الرجاء تحديد مده الرحلة"
              : "من ${range!.start.day}/${range!.start.month} الى ${range!.end.day}/${range!.end.month} المدة ${range!.duration.inDays} يوم",
          style:
              AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
