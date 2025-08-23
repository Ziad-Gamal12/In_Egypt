import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaPaymentDataEntity.dart';

class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
  SouhoolaPaymentDataEntity toEntity() =>
      SouhoolaPaymentDataEntity(redirectTo: redirectTo);
  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
