import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          if (cartController.items.isEmpty) {
            return Center(
              child: Text('Your cart is empty'),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.items[index];
                    return CartListItem(
                      cartItem: cartItem,
                      onIncrement: () => cartController.incrementQuantity(cartItem),
                      onDecrement: () => cartController.decrementQuantity(cartItem),
                      onRemove: () => cartController.removeFromCart(cartItem),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${cartController.totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Implement checkout logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Checkout not implemented')),
                        );
                      },
                      child: Text('Proceed to Checkout'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}