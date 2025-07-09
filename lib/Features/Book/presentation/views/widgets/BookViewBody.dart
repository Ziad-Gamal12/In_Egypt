import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingButton.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingStepsPageView.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingStepsRow.dart';
import 'package:in_egypt/constant.dart';

class BookViewBody extends StatefulWidget {
  const BookViewBody({
    super.key,
  });
  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {
  DateTimeRange<DateTime>? range;
  int currentIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepsCubit, StepsState>(
      listener: (context, state) {
        if (state is StepsChanged) {
          currentIndex = state.index;
        } else if (state is StepsDateRangeSelected) {
          range = state.range;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(
              vertical: kVerticalPadding, horizontal: kHorizentalPadding),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBookingStepsRow(currentIndex: currentIndex),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: CustomBookingStepsPageView(
                          currentIndex: currentIndex),
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 16,
                  right: 16,
                  bottom: 20,
                  child: CustomBookingButton(
                      range: range,
                      currentIndex: currentIndex,
                      formKey: formKey))
            ],
          ),
        );
      },
    );
  }
}
