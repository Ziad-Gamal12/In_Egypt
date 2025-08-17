// visa_and_mastercard_data_entity.dart
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/visa_and_master_card/VisaAndMasterCardPaymentDataEntity%20.dart';

class VisaAndMasterCardDataEntity {
  final int? invoiceId;
  final String? invoiceKey;
  final VisaAndMasterCardPaymentDataEntity? paymentData;

  const VisaAndMasterCardDataEntity({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });
}
