import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaResponseEntity.dart';

import 'data.dart';

class SouhoolaResponse {
  String? status;
  Data? data;

  SouhoolaResponse({this.status, this.data});

  factory SouhoolaResponse.fromJson(Map<String, dynamic> json) {
    return SouhoolaResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
  SouhoolaResponseEntity toEntity() => SouhoolaResponseEntity(
      status: status, data: data?.toSouhoolaDataEntity());
  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
