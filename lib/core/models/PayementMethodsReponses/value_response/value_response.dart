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

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
