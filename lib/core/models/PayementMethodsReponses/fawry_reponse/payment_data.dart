import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Fawry/PaymentFawryDataEntity.dart';

class PaymentData {
  String? fawryCode;
  String? expireDate;

  PaymentData({this.fawryCode, this.expireDate});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        fawryCode: json['fawryCode'] as String?,
        expireDate: json['expireDate'] as String?,
      );
  PaymentFawryDataEntity toEntity() =>
      PaymentFawryDataEntity(fawryCode: fawryCode, expireDate: expireDate);
  Map<String, dynamic> toJson() => {
        'fawryCode': fawryCode,
        'expireDate': expireDate,
      };
}
