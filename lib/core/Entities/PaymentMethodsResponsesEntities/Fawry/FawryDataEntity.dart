// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Fawry/PaymentFawryDataEntity.dart';

class FawryDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final PaymentFawryDataEntity? paymentData;

  const FawryDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
