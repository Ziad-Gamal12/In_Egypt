// basata_response_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Basata/BasataDataEntity.dart';

class BasataResponseEntity {
  final String? status;
  final BasataDataEntity? data;

  const BasataResponseEntity({
    this.status,
    this.data,
  });
}
