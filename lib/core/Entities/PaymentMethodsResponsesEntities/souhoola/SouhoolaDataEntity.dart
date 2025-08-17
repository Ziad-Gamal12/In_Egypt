// souhoola_data_entity.dart
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
