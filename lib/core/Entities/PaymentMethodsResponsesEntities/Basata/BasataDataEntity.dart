// basata_data_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Basata/BasataPaymentDataEntity.dart';

class BasataDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final BasataPaymentDataEntity? paymentData;

  const BasataDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
