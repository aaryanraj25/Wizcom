import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartController with ChangeNotifier {
  Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.values.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.incrementQuantity();
    } else {
      _items[product.id] = CartItem(
        id: DateTime.now().toString(),
        product: product,
        quantity: 1,
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _items.remove(cartItem.product.id);
    notifyListeners();
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.incrementQuantity();
    notifyListeners();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.decrementQuantity();
    } else {
      _items.remove(cartItem.product.id);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}