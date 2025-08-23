import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment12_months/NbeInstallment12MonthsDataEntity.dart';

import 'payment_data.dart';

class Data {
  int? invoiceId;
  String? invoiceKey;
  PaymentData? paymentData;

  Data({this.invoiceId, this.invoiceKey, this.paymentData});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        invoiceId: json['invoice_id'] as int?,
        invoiceKey: json['invoice_key'] as String?,
        paymentData: json['payment_data'] == null
            ? null
            : PaymentData.fromJson(
                json['payment_data'] as Map<String, dynamic>),
      );
  NbeInstallment12MonthsDataEntity toNbeInstallment12MonthsDataEntity() =>
      NbeInstallment12MonthsDataEntity(
        invoiceId: invoiceId,
        invoiceKey: invoiceKey,
        paymentData: paymentData?.toNbeInstallment12MonthsPaymentDataEntity(),
      );
  Map<String, dynamic> toJson() => {
        'invoice_id': invoiceId,
        'invoice_key': invoiceKey,
        'payment_data': paymentData?.toJson(),
      };
}
