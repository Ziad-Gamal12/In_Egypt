// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';

class PaymentMethodEntity {
  final String? status;
  final List<DatumEntity>? data;

  const PaymentMethodEntity({
    this.status,
    this.data,
  });
}
