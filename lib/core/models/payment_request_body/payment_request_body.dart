import 'cart_item.dart';
import 'customer.dart';
import 'redirection_urls.dart';

class PaymentRequestBody {
  int? paymentMethodId;
  String? cartTotal;
  String? currency;
  Customer? customer;
  RedirectionUrls? redirectionUrls;
  List<CartItem>? cartItems;

  PaymentRequestBody({
    this.paymentMethodId,
    this.cartTotal,
    this.currency,
    this.customer,
    this.redirectionUrls,
    this.cartItems,
  });

  factory PaymentRequestBody.fromJson(Map<String, dynamic> json) {
    return PaymentRequestBody(
      paymentMethodId: json['payment_method_id'] as int?,
      cartTotal: json['cartTotal'] as String?,
      currency: json['currency'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      redirectionUrls: json['redirectionUrls'] == null
          ? null
          : RedirectionUrls.fromJson(
              json['redirectionUrls'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'payment_method_id': paymentMethodId,
        'cartTotal': cartTotal,
        'currency': currency,
        'customer': customer?.toJson(),
        'redirectionUrls': redirectionUrls?.toJson(),
        'cartItems': cartItems?.map((e) => e.toJson()).toList(),
      };
}
