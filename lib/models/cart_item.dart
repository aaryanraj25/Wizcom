import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  int quantity;

  CartItem({
    required this.id,
    required this.product,
    this.quantity = 1,
  });

  // Calculate the total price for this cart item
  double get totalPrice => product.price * quantity;

  // Factory constructor to create a CartItem from a JSON map
  factory CartItem.fromJson(Map<String, dynamic> json, Product product) {
    return CartItem(
      id: json['id'] as String,
      product: product,
      quantity: json['quantity'] as int,
    );
  }

  // Method to convert a CartItem to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': product.id,
      'quantity': quantity,
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'CartItem(id: $id, product: ${product.name}, quantity: $quantity, totalPrice: \$${totalPrice.toStringAsFixed(2)})';
  }

  // Override == operator for equality check
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem && other.id == id && other.product == product;
  }

  // Override hashCode for consistency with ==
  @override
  int get hashCode => id.hashCode ^ product.hashCode;

  // Create a copy of the cart item with optional parameter updates
  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  // Increment quantity
  void incrementQuantity() {
    quantity++;
  }

  // Decrement quantity
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}