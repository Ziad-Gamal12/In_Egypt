import '../../Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'datum.dart';

class PaymentMethodModel {
  String? status;
  List<Datum>? data;

  PaymentMethodModel({this.status, this.data});

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  factory PaymentMethodModel.fromEntity(PaymentMethodEntity entity) {
    return PaymentMethodModel(
      status: entity.status,
      data: entity.data?.map((e) => Datum.fromEntity(e)).toList(),
    );
  }
  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      status: status,
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
