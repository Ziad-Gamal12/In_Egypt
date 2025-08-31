import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookDeatilsPageViewItem.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomBookPaymentPageViewItem.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';

class CustomBookingStepsPageView extends StatefulWidget {
  const CustomBookingStepsPageView({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });
  final int currentIndex;
  final ValueChanged<DatumEntity> onSelected;

  @override
  State<CustomBookingStepsPageView> createState() =>
      _CustomBookingStepsPageViewState();
}

class _CustomBookingStepsPageViewState
    extends State<CustomBookingStepsPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.read<StepsCubit>().pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CustomBookDeatilsPageViewItem(),
        CustomBookPaymentPageViewItem(
          onSelected: widget.onSelected,
        ),
      ],
    );
  }
}
