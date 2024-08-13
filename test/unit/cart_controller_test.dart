import 'package:flutter_test/flutter_test.dart';
import 'package:wizcom/controllers/cart_controller.dart';
import 'package:wizcom/models/product.dart';

void main() {
  late CartController cartController;
  late Product testProduct;

  setUp(() {
    cartController = CartController();
    testProduct = Product(
      id: '1',
      name: 'Test Product',
      description: 'Test Description',
      price: 10.0,
      imageUrl: 'test_url',
    );
  });

  test('Initial cart should be empty', () {
    expect(cartController.items, isEmpty);
    expect(cartController.itemCount, equals(0));
    expect(cartController.totalPrice, equals(0));
  });

  test('Adding item to cart should update cart state', () {
    cartController.addToCart(testProduct);

    expect(cartController.items.length, equals(1));
    expect(cartController.itemCount, equals(1));
    expect(cartController.totalPrice, equals(10.0));
  });

  test('Adding same item twice should increase quantity', () {
    cartController.addToCart(testProduct);
    cartController.addToCart(testProduct);

    expect(cartController.items.length, equals(1));
    expect(cartController.items[0].quantity, equals(2));
    expect(cartController.totalPrice, equals(20.0));
  });

  test('Removing item from cart should update cart state', () {
    cartController.addToCart(testProduct);
    cartController.removeFromCart(cartController.items[0]);

    expect(cartController.items, isEmpty);
    expect(cartController.itemCount, equals(0));
    expect(cartController.totalPrice, equals(0));
  });

  test('Incrementing quantity should update cart state', () {
    cartController.addToCart(testProduct);
    cartController.incrementQuantity(cartController.items[0]);

    expect(cartController.items[0].quantity, equals(2));
    expect(cartController.totalPrice, equals(20.0));
  });

  test('Decrementing quantity should update cart state', () {
    cartController.addToCart(testProduct);
    cartController.addToCart(testProduct);
    cartController.decrementQuantity(cartController.items[0]);

    expect(cartController.items[0].quantity, equals(1));
    expect(cartController.totalPrice, equals(10.0));
  });

  test('Decrementing quantity to zero should remove item', () {
    cartController.addToCart(testProduct);
    cartController.decrementQuantity(cartController.items[0]);

    expect(cartController.items, isEmpty);
    expect(cartController.itemCount, equals(0));
    expect(cartController.totalPrice, equals(0));
  });

  test('Clearing cart should remove all items', () {
    cartController.addToCart(testProduct);
    cartController.addToCart(testProduct);
    cartController.clearCart();

    expect(cartController.items, isEmpty);
    expect(cartController.itemCount, equals(0));
    expect(cartController.totalPrice, equals(0));
  });
}