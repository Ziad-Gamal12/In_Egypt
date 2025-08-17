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

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
