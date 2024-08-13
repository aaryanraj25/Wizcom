import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wizcom/controllers/cart_controller.dart';
import 'package:wizcom/controllers/product_controller.dart';
import 'package:wizcom/main.dart';
import 'package:wizcom/services/data_services.dart';

void main() {
  testWidgets('App should build and display ProductListScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider(create: (_) => DataService()),
          ChangeNotifierProvider(create: (context) => ProductController(context.read<DataService>())),
          ChangeNotifierProvider(create: (_) => CartController()),
        ],
        child: MyApp(),
      ),
    );

    // Verify that the ProductListScreen is displayed.
    expect(find.text('Product List'), findsOneWidget);

    // Verify that the search bar is present.
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the cart icon is present.
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });
}