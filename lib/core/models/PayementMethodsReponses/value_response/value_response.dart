import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Value/ValueResponseEntity.dart';

import 'data.dart';

class ValueResponse {
  String? status;
  Data? data;

  ValueResponse({this.status, this.data});

  factory ValueResponse.fromJson(Map<String, dynamic> json) => ValueResponse(
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );
  ValueResponseEntity toEntity() {
    return ValueResponseEntity(
      status: status,
      data: data?.toValueDataEntity(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
