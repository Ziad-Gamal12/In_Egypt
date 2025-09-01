import 'package:bloc/bloc.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

part 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(StepsInitial());
  PageController pageController = PageController(initialPage: 0);
  void changeStep(
    int? index, {
    required int currentIndex,
  }) {
    if (index == null) {
      currentIndex += 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      emit(StepsChanged(index: currentIndex));
    } else {
      if (index < currentIndex) {
        currentIndex = index;
        pageController.jumpToPage(currentIndex);
        emit(StepsChanged(index: currentIndex));
      }
    }
  }

  void selectDateRange({required BuildContext context}) async {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    TextStyle customTextStyle = AppTextStyles(context)
        .semiBold16
        .copyWith(color: isDark ? Colors.white : Colors.black);
    DateTimeRange<DateTime>? range = await showRangePickerDialog(
      context: context,
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      width: double.infinity,
      selectedCellsTextStyle: customTextStyle,
      currentDateTextStyle: customTextStyle,
      currentDate: DateTime.now(),
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
    if (range != null) {
      emit(StepsDateRangeSelected(range: range));
    }
  }
}
