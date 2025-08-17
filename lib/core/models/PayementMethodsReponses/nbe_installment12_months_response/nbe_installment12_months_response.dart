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

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
