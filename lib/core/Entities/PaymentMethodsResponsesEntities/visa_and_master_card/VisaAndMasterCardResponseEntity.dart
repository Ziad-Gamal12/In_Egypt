// visa_and_mastercard_response_entity.dart
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/visa_and_master_card/VisaAndMasterCardDataEntity.dart';

class VisaAndMasterCardResponseEntity {
  final String? status;
  final VisaAndMasterCardDataEntity? data;

  const VisaAndMasterCardResponseEntity({
    this.status,
    this.data,
  });
}
