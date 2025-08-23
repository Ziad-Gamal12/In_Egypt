import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Basata/BasataPaymentDataEntity.dart';

class PaymentData {
  int? masaryCode;

  PaymentData({this.masaryCode});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        masaryCode: json['masaryCode'] as int?,
      );
  BasataPaymentDataEntity toEntity() =>
      BasataPaymentDataEntity(masaryCode: masaryCode);
  Map<String, dynamic> toJson() => {
        'masaryCode': masaryCode,
      };
}
