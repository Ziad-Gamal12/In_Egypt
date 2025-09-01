// souhoola_response_entity.dart

// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaDataEntity.dart';

class SouhoolaResponseEntity {
  final String? status;
  final SouhoolaDataEntity? data;

  const SouhoolaResponseEntity({
    this.status,
    this.data,
  });
}
