import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wizcom/controllers/product_controller.dart';
import 'package:wizcom/models/product.dart';
import 'package:wizcom/services/data_services.dart';


class MockDataService extends Mock implements DataService {}

void main() {
  late ProductController productController;
  late MockDataService mockDataService;

  setUp(() {
    mockDataService = MockDataService();
    productController = ProductController(mockDataService);
  });

  test('Initial products list should be empty', () {
    expect(productController.products, isEmpty);
  });

  test('Load products should update products list', () async {
    final testProducts = [
      Product(id: '1', name: 'Test Product 1', description: 'Description 1', price: 10.0, imageUrl: 'url1'),
      Product(id: '2', name: 'Test Product 2', description: 'Description 2', price: 20.0, imageUrl: 'url2'),
    ];

    when(mockDataService.getProducts()).thenAnswer((_) async => testProducts);


    expect(productController.products, equals(testProducts));
  });

  test('Search products should filter products list', () async {
    final testProducts = [
      Product(id: '1', name: 'Apple', description: 'Description 1', price: 10.0, imageUrl: 'url1'),
      Product(id: '2', name: 'Banana', description: 'Description 2', price: 20.0, imageUrl: 'url2'),
    ];

    when(mockDataService.getProducts()).thenAnswer((_) async => testProducts);

    
    productController.searchProducts('Apple');

    expect(productController.products.length, equals(1));
    expect(productController.products[0].name, equals('Apple'));
  });
}