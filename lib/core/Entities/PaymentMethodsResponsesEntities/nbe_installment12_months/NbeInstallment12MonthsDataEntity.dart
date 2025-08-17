// nbe_installment_12_months_data_entity.dart
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment12_months/NbeInstallment12MonthsPaymentDataEntity.dart';

class NbeInstallment12MonthsDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final NbeInstallment12MonthsPaymentDataEntity? paymentData;

  const NbeInstallment12MonthsDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
