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

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
