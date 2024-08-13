import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizcom/services/data_services.dart';
import 'package:wizcom/views/product_list_screen.dart';
import 'controllers/product_controller.dart';
import 'controllers/cart_controller.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DataService()),
        ChangeNotifierProvider(
          create: (context) => ProductController(
            Provider.of<DataService>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}