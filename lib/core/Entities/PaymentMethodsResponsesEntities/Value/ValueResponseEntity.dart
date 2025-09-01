// value_response_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Value/ValueDataEntity.dart';

class ValueResponseEntity {
  final String? status;
  final ValueDataEntity? data;

  const ValueResponseEntity({
    this.status,
    this.data,
  });
}
