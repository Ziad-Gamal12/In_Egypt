import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomBookDateSelector extends StatefulWidget {
  const CustomBookDateSelector({
    super.key,
  });

  @override
  State<CustomBookDateSelector> createState() => _CustomBookDateSelectorState();
}

class _CustomBookDateSelectorState extends State<CustomBookDateSelector> {
  DateTimeRange<DateTime>? range;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    BookingEntity bookingEntity = context.read<BookingEntity>();
    return BlocConsumer<StepsCubit, StepsState>(
      listener: (context, state) {
        if (state is StepsDateRangeSelected) {
          range = state.range;
          bookingEntity.startAt = state.range.start;
          bookingEntity.endAt = state.range.end;
          bookingEntity.daysDuration = state.range.duration.inDays;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<StepsCubit>().selectDateRange(context: context);
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isDark ? Colors.grey[850] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: range != null ? kMainColor : Colors.grey, width: 2)),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidCalendarDays, color: Colors.grey),
                Spacer(),
                Text(
                  getText(range),
                  style: AppTextStyles(context).semiBold16.copyWith(
                      color: isDark == true ? Colors.white : Colors.black),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  String getText(DateTimeRange<DateTime>? range) {
    if (range != null) {
      return "من ${range.start.day}/${range.start.month} الى ${range.end.day}/${range.end.month} المدة ${range.duration.inDays} يوم";
    } else {
      return "الرجاء تحديد مده الرحلة";
    }
  }
}
