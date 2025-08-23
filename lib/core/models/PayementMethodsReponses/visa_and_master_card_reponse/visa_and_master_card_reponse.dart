import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/visa_and_master_card/VisaAndMasterCardResponseEntity.dart';

import 'data.dart';

class VisaAndMasterCardReponse {
  String? status;
  Data? data;

  VisaAndMasterCardReponse({this.status, this.data});

  factory VisaAndMasterCardReponse.fromJson(Map<String, dynamic> json) {
    return VisaAndMasterCardReponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  VisaAndMasterCardResponseEntity toEntity() {
    return VisaAndMasterCardResponseEntity(
      status: status,
      data: data?.toEntity(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
