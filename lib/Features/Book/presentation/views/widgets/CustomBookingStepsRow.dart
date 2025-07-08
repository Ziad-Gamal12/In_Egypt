import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Book/domain/entities/CustomBookingStepsEntity.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class CustomBookingStepsRow extends StatelessWidget {
  const CustomBookingStepsRow({
    super.key,
    required this.steps,
    required this.currentIndex,
    required this.indexChanged,
  });

  final List<CustomBookingStepsEntity> steps;
  final int currentIndex;
  final ValueChanged<int> indexChanged;
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
                          if (e.key < currentIndex) {
                            indexChanged(e.key);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == e.key
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
