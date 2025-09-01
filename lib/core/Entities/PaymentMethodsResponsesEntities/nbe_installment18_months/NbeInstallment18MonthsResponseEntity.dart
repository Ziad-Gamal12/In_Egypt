// nbe_installment_18_months_response_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment18_months/NbeInstallment18MonthsDataEntity.dart';

class NbeInstallment18MonthsResponseEntity {
  final String? status;
  final NbeInstallment18MonthsDataEntity? data;

  const NbeInstallment18MonthsResponseEntity({
    this.status,
    this.data,
  });
}
