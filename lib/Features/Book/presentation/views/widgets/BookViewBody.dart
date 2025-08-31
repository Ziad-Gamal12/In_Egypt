import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingButton.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingStepsPageView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class BookViewBody extends StatefulWidget {
  const BookViewBody({
    super.key,
    required this.place,
  });
  final PlaceEntity place;
  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {
  DateTimeRange<DateTime>? range;
  int currentIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatumEntity? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StepsCubit, StepsState>(
      listener: (context, state) {
        stepsBlocListenerHandeler(state);
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
            vertical: kVerticalPadding, horizontal: kHorizentalPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: Form(
                key: formKey,
                child: CustomBookingStepsPageView(
                    onSelected: (value) {
                      selectedMethod = value;
                      setState(() {});
                    },
                    currentIndex: currentIndex),
              ),
            ),
            Positioned(
                left: 16,
                right: 16,
                bottom: 20,
                child: CustomBookingButton(
                    range: range,
                    place: widget.place,
                    selectedMethod: selectedMethod,
                    currentIndex: currentIndex,
                    formKey: formKey))
          ],
        ),
      ),
    );
  }

  void stepsBlocListenerHandeler(StepsState state) {
    if (state is StepsChanged) {
      setState(() {
        currentIndex = state.index;
      });
    } else if (state is StepsDateRangeSelected) {
      setState(() {
        range = state.range;
      });
    }
  }
}
