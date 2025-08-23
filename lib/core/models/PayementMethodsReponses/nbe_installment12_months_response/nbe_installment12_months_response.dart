import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/nbe_installment12_months/NbeInstallment12MonthsResponseEntity.dart';

import 'data.dart';

class NbeInstallment12MonthsResponse {
  String? status;
  Data? data;

  NbeInstallment12MonthsResponse({this.status, this.data});

  factory NbeInstallment12MonthsResponse.fromJson(Map<String, dynamic> json) {
    return NbeInstallment12MonthsResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
  NbeInstallment12MonthsResponseEntity toEntity() =>
      NbeInstallment12MonthsResponseEntity(
          status: status, data: data?.toNbeInstallment12MonthsDataEntity());
  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
