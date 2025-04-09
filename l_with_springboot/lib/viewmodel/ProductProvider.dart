import 'package:flutter/material.dart';
import 'package:l_with_springboot/product/Product.dart';
import 'package:l_with_springboot/service/ProductAPIService.dart';

class ProductProvider with ChangeNotifier {

  final ProductAPIService _apiService = ProductAPIService();

  List<Product> _products = [];   // 비공개 _products (상태)

  List<Product> get products => _products;  // _products 의 getter (View 에서는 products 라는 이름으로 호출)

  Future<void> registProduct(Product product) async {
    try {
      final Product newProduct = await _apiService.registProduct(product);
      _products.add(newProduct); // 상태가 변함
      notifyListeners(); // 상태 변화 알림
    } catch(e) {
      print("----- registProduct : $e");
    }
  }

  Future<void> fetchProduct() async {
    try {
      _products = await _apiService.getProductList(); // 상태가 변함
      notifyListeners();                              // 상태 변화 알림
    } catch(e) {
      print("----- fetchProduct : $e");
    }
  }
  
}