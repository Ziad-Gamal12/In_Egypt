// souhoola_response_entity.dart

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaDataEntity.dart';

class SouhoolaResponseEntity {
  final String? status;
  final SouhoolaDataEntity? data;

  const SouhoolaResponseEntity({
    this.status,
    this.data,
  });
}
