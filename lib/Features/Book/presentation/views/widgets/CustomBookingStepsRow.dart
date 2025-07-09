import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Book/domain/entities/CustomBookingStepsEntity.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
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
    CustomBookingStepsEntity(
      title: "مراجعة الحجز",
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
                      padding: EdgeInsets.only(left: e.key == 2 ? 0 : 20),
                      child: GestureDetector(
                        onTap: () {
                          context.read<StepsCubit>().changeStep(e.key,
                              currentIndex: widget.currentIndex);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: widget.currentIndex == e.key
                                ? kMainColor
                                : Colors.grey.shade100,
                          ),
                          child: Text(
                            e.value.title,
                            style: AppTextStyles(context).regular14,
                          ),
                        ).animate().moveY(begin: -20).fadeIn(
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
