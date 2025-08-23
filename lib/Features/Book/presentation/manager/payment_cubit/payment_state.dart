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
// requestPaymentMethod

final class PaymentRequestPaymentMethodLoading extends PaymentState {}

final class PaymentRequestPaymentMethodSuccess extends PaymentState {
  final RequestPaymentMethodReponse requestPaymentMethodReponse;
  PaymentRequestPaymentMethodSuccess(this.requestPaymentMethodReponse);
}

final class PaymentRequestPaymentMethodFailure extends PaymentState {
  final String errmessage;
  PaymentRequestPaymentMethodFailure(this.errmessage);
}
