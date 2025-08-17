import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomBookingButton extends StatelessWidget {
  const CustomBookingButton({
    super.key,
    required this.currentIndex,
    required this.formKey,
    required this.range,
  });

  final int currentIndex;
  final GlobalKey<FormState> formKey;
  final DateTimeRange<DateTime>? range;

  @override
  Widget build(BuildContext context) {
    return Custombutton(
        text: currentIndex != 1 ? "التالي" : "دفع الان",
        color: kMainColor,
        textColor: Colors.white,
        onPressed: () {
          onTap(context);
        });
  }

  void onTap(BuildContext context) {
    if (currentIndex == 0) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        if (range != null) {
          context.read<BookingCubit>().bookingEntity.startAt = range!.start;
          context.read<BookingCubit>().bookingEntity.endAt = range!.end;
          context.read<BookingCubit>().bookingEntity.daysDuration =
              range!.duration.inDays;
          context.read<StepsCubit>().changeStep(
                null,
                currentIndex: currentIndex,
              );
        } else {
          showErrorSnackBar(context: context, message: "يرجى تحديد مده الرحلة");
        }
      }
    } else {
      context.read<StepsCubit>().changeStep(
            null,
            currentIndex: currentIndex,
          );
    }
  }
}
