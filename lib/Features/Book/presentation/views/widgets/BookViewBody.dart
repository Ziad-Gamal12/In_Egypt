import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/domain/entities/CustomBookingStepsEntity.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingButton.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingStepsPageView.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookingStepsRow.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';

class BookViewBody extends StatefulWidget {
  const BookViewBody({super.key, required this.titleChanged});
  final ValueChanged<String> titleChanged;
  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {
  List<CustomBookingStepsEntity> steps = [
    CustomBookingStepsEntity(
      title: "تفاصيل الحجز",
    ),
    CustomBookingStepsEntity(
      title: "الدفع",
    ),
    CustomBookingStepsEntity(
      title: "مراجعة الحجز",
    ),
  ];
  DateTimeRange<DateTime>? range;
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
          vertical: kVerticalPadding, horizontal: kHorizentalPadding),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomBookingStepsRow(
                  indexChanged: (value) {
                    currentIndex.value = value;
                    setState(() {});
                  },
                  steps: steps,
                  currentIndex: currentIndex.value),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: CustomBookingStepsPageView(
                      rangeChanged: (value) {
                        range = value;
                        setState(() {});
                      },
                      currentIndex: currentIndex.value),
                ),
              ),
            ],
          ),
          Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: CustomBookingButton(
                  onPressed: () {
                    if (currentIndex.value == 0) {
                      if (formKey.currentState!.validate()) {
                        if (range != null) {
                          nextStep();
                        } else {
                          showErrorSnackBar(
                              context: context,
                              message: "يرجى تحديد مده الرحلة");
                        }
                      }
                    } else if (currentIndex.value == 1) {
                      nextStep();
                    } else {
                      widget.titleChanged(steps[currentIndex.value].title);
                    }
                  },
                  currentIndex: currentIndex,
                  formKey: formKey))
        ],
      ),
    );
  }

  void nextStep() {
    formKey.currentState!.save();
    currentIndex.value += 1;
    widget.titleChanged(steps[currentIndex.value].title);
    setState(() {});
  }
}
