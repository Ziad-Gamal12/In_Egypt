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

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
