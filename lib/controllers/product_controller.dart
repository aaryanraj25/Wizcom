import 'package:flutter/foundation.dart';
import 'package:wizcom/services/data_services.dart';
import '../models/product.dart';


class ProductController with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  final DataService _dataService;

  ProductController(this._dataService) {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    _products = await _dataService.getProducts();
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _loadProducts();
    } else {
      _products = _products.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
      notifyListeners();
    }
  }
}