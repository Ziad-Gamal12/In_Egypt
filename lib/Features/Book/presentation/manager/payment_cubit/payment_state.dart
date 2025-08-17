part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentFetchPaymentMethodsLoading extends PaymentState {}

final class PaymentFetchPaymentMethodsSuccess extends PaymentState {
  final PaymentMethodEntity paymentMethodEntity;
  PaymentFetchPaymentMethodsSuccess(this.paymentMethodEntity);
}

final class PaymentFetchPaymentMethodsFailure extends PaymentState {
  final String errmessage;
  PaymentFetchPaymentMethodsFailure(this.errmessage);
}
