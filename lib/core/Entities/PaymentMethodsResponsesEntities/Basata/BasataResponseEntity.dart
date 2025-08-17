// basata_response_entity.dart
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Basata/BasataDataEntity.dart';

class BasataResponseEntity {
  final String? status;
  final BasataDataEntity? data;

  const BasataResponseEntity({
    this.status,
    this.data,
  });
}
