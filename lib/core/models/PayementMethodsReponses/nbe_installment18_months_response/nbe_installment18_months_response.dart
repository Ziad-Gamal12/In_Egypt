import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment18_months/NbeInstallment18MonthsResponseEntity.dart';

import 'data.dart';

class NbeInstallment18MonthsResponse {
  String? status;
  Data? data;

  NbeInstallment18MonthsResponse({this.status, this.data});

  factory NbeInstallment18MonthsResponse.fromJson(Map<String, dynamic> json) {
    return NbeInstallment18MonthsResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
  NbeInstallment18MonthsResponseEntity toEntity() =>
      NbeInstallment18MonthsResponseEntity(
        status: status,
        data: data?.toEntity(),
      );
  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
