import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wizcom/widgets/cart_item.dart';
import '../widgets/product_list_item.dart';
import '../../controllers/product_controller.dart';
import 'product_detail_screen.dart';
import '../widgets/search_bar.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          CartIcon(),
        ],
      ),
      body: Column(
        children: [
          CustomSearchBar(),
          Expanded(
            child: Consumer<ProductController>(
              builder: (context, productController, child) {
                if (productController.products.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return AnimationLimiter(
                  child: ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      final product = productController.products[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ProductListItem(
                              product: product,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(product: product),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}