import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Value/ValuePaymentDataEntity.dart';

class PaymentData {
  String? redirectTo;

  PaymentData({this.redirectTo});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectTo: json['redirectTo'] as String?,
      );
  ValuePaymentDataEntity toValuePaymentDataEntity() =>
      ValuePaymentDataEntity(redirectTo: redirectTo);
  Map<String, dynamic> toJson() => {
        'redirectTo': redirectTo,
      };
}
