import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment12_months/NbeInstallment12MonthsPaymentDataEntity.dart';

class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
  NbeInstallment12MonthsPaymentDataEntity
      toNbeInstallment12MonthsPaymentDataEntity() =>
          NbeInstallment12MonthsPaymentDataEntity(redirectTo: redirectTo);
  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
