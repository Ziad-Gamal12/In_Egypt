import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment18_months/NbeInstallment18MonthsPaymentDataEntity.dart';

class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
  NbeInstallment18MonthsPaymentDataEntity toEntity() =>
      NbeInstallment18MonthsPaymentDataEntity(redirectTo: redirectTo);
  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
