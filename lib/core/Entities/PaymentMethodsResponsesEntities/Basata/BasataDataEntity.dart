// basata_data_entity.dart
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
