import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Fawry/FawryDataEntity.dart';

class FawryResponseEntity {
  final String? status;
  final FawryDataEntity? data;

  const FawryResponseEntity({
    this.status,
    this.data,
  });
}
