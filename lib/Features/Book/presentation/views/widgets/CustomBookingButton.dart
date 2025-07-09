import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        text: currentIndex != 2 ? "التالي" : "تأكيد الحجز",
        color: kMainColor,
        textColor: Colors.white,
        onPressed: () {
          if (currentIndex == 0) {
            if (formKey.currentState!.validate()) {
              if (range != null) {
                formKey.currentState!.save();
                context.read<StepsCubit>().changeStep(
                      null,
                      currentIndex: currentIndex,
                    );
              } else {
                showErrorSnackBar(
                    context: context, message: "يرجى تحديد مده الرحلة");
              }
            }
          } else if (currentIndex == 1) {
            context.read<StepsCubit>().changeStep(
                  null,
                  currentIndex: currentIndex,
                );
          } else {}
        });
  }
}
