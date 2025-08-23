class CartItem {
  String? name;
  String? price;
  String? quantity;

  CartItem({this.name, this.price, this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        name: json['name'] as String?,
        price: json['price'] as String?,
        quantity: json['quantity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'quantity': quantity,
      };
}
