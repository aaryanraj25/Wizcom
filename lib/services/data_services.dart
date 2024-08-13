import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product.dart';

class DataService {
  Future<List<Product>> getProducts() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 1));

    // Load the JSON file from the assets
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final jsonData = json.decode(jsonString) as List;

    // Convert the JSON data to a list of Product objects
    return jsonData.map((json) => Product.fromJson(json)).toList();
  }
}