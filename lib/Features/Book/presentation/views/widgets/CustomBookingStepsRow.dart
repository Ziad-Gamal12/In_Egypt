import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Book/domain/entities/CustomBookingStepsEntity.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomStepRowItem.dart';
import 'package:provider/provider.dart';

class CustomBookingStepsRow extends StatefulWidget {
  const CustomBookingStepsRow({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  State<CustomBookingStepsRow> createState() => _CustomBookingStepsRowState();
}

class _CustomBookingStepsRowState extends State<CustomBookingStepsRow> {
  List<CustomBookingStepsEntity> steps = [
    CustomBookingStepsEntity(
      title: "تفاصيل الحجز",
    ),
    CustomBookingStepsEntity(
      title: "الدفع",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(color: Colors.grey.shade100, thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: steps
              .asMap()
              .entries
              .map((e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: e.key == 1 ? 0 : 20),
                      child: GestureDetector(
                        onTap: () {
                          context.read<StepsCubit>().changeStep(e.key,
                              currentIndex: widget.currentIndex);
                        },
                        child: CustomStepRowItem(
                                e: e, currentIndex: widget.currentIndex)
                            .animate()
                            .moveY(begin: -20)
                            .fadeIn(
                                duration: 600.ms,
                                delay: Duration(milliseconds: e.key * 200)),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
