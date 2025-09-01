// souhoola_data_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaPaymentDataEntity.dart';

class SouhoolaDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final SouhoolaPaymentDataEntity? paymentData;

  const SouhoolaDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
