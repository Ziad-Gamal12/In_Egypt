// visa_and_mastercard_data_entity.dart
// ignore_for_file: file_names

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
