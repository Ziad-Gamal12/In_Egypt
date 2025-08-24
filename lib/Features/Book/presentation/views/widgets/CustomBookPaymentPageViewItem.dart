import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Book/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomPaymentMethodItem.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomWebView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/CustomWebViewNavigationRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';

class CustomBookPaymentPageViewItem extends StatefulWidget {
  const CustomBookPaymentPageViewItem({super.key, required this.onSelected});
  final ValueChanged<DatumEntity> onSelected;
  @override
  State<CustomBookPaymentPageViewItem> createState() =>
      _CustomBookPaymentPageViewItemState();
}

class _CustomBookPaymentPageViewItemState
    extends State<CustomBookPaymentPageViewItem> {
  int currentIndex = -1;
  @override
  void initState() {
    context.read<PaymentCubit>().fetchPaymentMethods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentRequestPaymentMethodSuccess) {
          CustomWebViewNavigationRequirmentsEntity requirmentsEntity =
              CustomWebViewNavigationRequirmentsEntity(
                  url: state.requestPaymentMethodReponse.redirectUrl,
                  bookingEntity: context.read<BookingEntity>());
          GoRouter.of(context)
              .push(CustomWebView.routeName, extra: requirmentsEntity);
        } else if (state is PaymentRequestPaymentMethodFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        if (state is PaymentFetchPaymentMethodsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        } else if (state is PaymentFetchPaymentMethodsFailure) {
          return CustomErrorWidget(message: state.errmessage);
        } else if (state is PaymentFetchPaymentMethodsSuccess) {
          PaymentMethodEntity paymentMethodEntity = state.paymentMethodEntity;
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizentalPadding, vertical: kVerticalPadding),
            child: ListView.builder(
                itemCount: paymentMethodEntity.data!.length,
                padding: const EdgeInsets.only(bottom: 40),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      widget.onSelected(paymentMethodEntity.data![index]);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AspectRatio(
                          aspectRatio: 4 / 1,
                          child: CustomPaymentMethodItem(
                            method: paymentMethodEntity.data![index],
                            isSelected: currentIndex == index,
                          )
                              .animate()
                              .moveY(
                                  begin: 50,
                                  curve: Curves.easeInOut,
                                  duration: 500.ms,
                                  delay: (200 * index).ms)
                              .fadeIn(
                                  duration: 500.ms, delay: (200 * index).ms)),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        }
      },
    );
  }
}
