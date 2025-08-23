import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/visa_and_master_card/VisaAndMasterCardPaymentDataEntity%20.dart';

class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
  factory PaymentData.fromEntity(VisaAndMasterCardPaymentDataEntity entity) =>
      PaymentData(redirectTo: entity.redirectTo);
  VisaAndMasterCardPaymentDataEntity toEntity() =>
      VisaAndMasterCardPaymentDataEntity(redirectTo: redirectTo);
  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
