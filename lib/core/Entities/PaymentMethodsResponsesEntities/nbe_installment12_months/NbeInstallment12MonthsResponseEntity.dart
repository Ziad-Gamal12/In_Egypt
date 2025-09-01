// nbe_installment_12_months_response_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment12_months/NbeInstallment12MonthsDataEntity.dart';

class NbeInstallment12MonthsResponseEntity {
  final String? status;
  final NbeInstallment12MonthsDataEntity? data;

  const NbeInstallment12MonthsResponseEntity({
    this.status,
    this.data,
  });
}
