// value_data_entity.dart

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Value/ValuePaymentDataEntity.dart';

class ValueDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final ValuePaymentDataEntity? paymentData;

  const ValueDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
