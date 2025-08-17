import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';

class Datum {
  int? paymentId;
  String? nameEn;
  String? nameAr;
  String? redirect;
  String? logo;

  Datum({
    this.paymentId,
    this.nameEn,
    this.nameAr,
    this.redirect,
    this.logo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        paymentId: json['paymentId'] as int?,
        nameEn: json['name_en'] as String?,
        nameAr: json['name_ar'] as String?,
        redirect: json['redirect'] as String?,
        logo: json['logo'] as String?,
      );
  factory Datum.fromEntity(DatumEntity entity) => Datum(
        paymentId: entity.paymentId,
        nameEn: entity.nameEn,
        nameAr: entity.nameAr,
        redirect: entity.redirect,
        logo: entity.logo,
      );
  DatumEntity toEntity() => DatumEntity(
        paymentId: paymentId,
        nameEn: nameEn,
        nameAr: nameAr,
        redirect: redirect,
        logo: logo,
      );
  Map<String, dynamic> toJson() => {
        'paymentId': paymentId,
        'name_en': nameEn,
        'name_ar': nameAr,
        'redirect': redirect,
        'logo': logo,
      };
}
