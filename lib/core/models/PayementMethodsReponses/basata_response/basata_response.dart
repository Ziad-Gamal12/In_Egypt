import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Basata/BasataResponseEntity.dart';

import 'data.dart';

class BasataResponse {
  String? status;
  Data? data;

  BasataResponse({this.status, this.data});

  factory BasataResponse.fromJson(Map<String, dynamic> json) {
    return BasataResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
  BasataResponseEntity toEntity() =>
      BasataResponseEntity(status: status, data: data?.toBasataDataEntity());
  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
