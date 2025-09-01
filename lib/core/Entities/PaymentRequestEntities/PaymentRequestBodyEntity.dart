// payment_request_body_entity.dart
// ignore_for_file: file_names

import 'package:in_egypt/core/Entities/PaymentRequestEntities/CartItemEntity.dart';
import 'package:in_egypt/core/Entities/PaymentRequestEntities/CustomerEntity.dart';
import 'package:in_egypt/core/Entities/PaymentRequestEntities/RedirectionUrlsEntity.dart';

class PaymentRequestBodyEntity {
  final int? paymentMethodId;
  final String? cartTotal;
  final String? currency;
  final CustomerEntity? customer;
  final RedirectionUrlsEntity? redirectionUrls;
  final List<CartItemEntity>? cartItems;

  const PaymentRequestBodyEntity({
    this.paymentMethodId,
    this.cartTotal,
    this.currency,
    this.customer,
    this.redirectionUrls,
    this.cartItems,
  });
}
