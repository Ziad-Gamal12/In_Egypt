import 'package:in_egypt/core/utils/images.dart';

class PaymentMethodEntity {
  final String name;
  final String icon;
  PaymentMethodEntity({required this.name, required this.icon});
  static List<PaymentMethodEntity> paymentMethods = [
    PaymentMethodEntity(name: "Cride Card", icon: Assets.assetsIconsCridteCard),
    PaymentMethodEntity(name: "Vodafone", icon: Assets.assetsIconsVodafone),
    PaymentMethodEntity(name: "paypal", icon: Assets.assetsIconsPaypal),
  ];
}
