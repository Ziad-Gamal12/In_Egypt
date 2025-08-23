import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomBookingButton extends StatelessWidget {
  const CustomBookingButton({
    super.key,
    required this.currentIndex,
    required this.formKey,
    required this.place,
    required this.range,
    required this.selectedMethod,
  });
  final DatumEntity? selectedMethod;
  final PlaceEntity place;
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
    BookingEntity bookingEntity = context.read<BookingEntity>();
    if (currentIndex == 0) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        if (range != null) {
          context.read<StepsCubit>().changeStep(
                null,
                currentIndex: currentIndex,
              );
        } else {
          showErrorSnackBar(context: context, message: "يرجى تحديد مده الرحلة");
        }
      }
    } else {
      bookingEntity.paymentMethod = selectedMethod?.nameEn ?? "";
      bookingEntity.totalPrice = bookingEntity.calculateTotalPrice();
      context.read<PaymentCubit>().requestPaymentMethod(
          methodId: selectedMethod!.paymentId!, booking: bookingEntity);
    }
  }
}
