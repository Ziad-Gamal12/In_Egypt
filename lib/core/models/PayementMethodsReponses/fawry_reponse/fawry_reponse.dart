import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Fawry/FawryResponseEntity.dart';

import 'data.dart';

class FawryReponse {
  String? status;
  Data? data;

  FawryReponse({this.status, this.data});

  factory FawryReponse.fromJson(Map<String, dynamic> json) => FawryReponse(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );
  FawryResponseEntity toEntity() {
    return FawryResponseEntity(
      status: status,
      data: data?.toFawryDataEntity(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
