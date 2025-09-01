// nbe_installment_18_months_data_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment18_months/NbeInstallment18MonthsPaymentDataEntity.dart';

class NbeInstallment18MonthsDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final NbeInstallment18MonthsPaymentDataEntity? paymentData;

  const NbeInstallment18MonthsDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
