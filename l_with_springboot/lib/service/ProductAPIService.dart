// Spring Boot API 서버와 통신을 담당하는 서비스

// Spring Boot API 서버에서 Flutter 의 요청 포트 번호를 5000 으로 등록해 두었으므로,
// Flutter 의 포트 번호를 5000 으로 고정해야 합니다.
// 포트 고정 방법
// [RUN] - [Edit Configurations] - Additional run args 필드에 인자 등록
// --web-port=5000

// Flutter 앱에서는 동일 기기의 Spring Boot API 서버로 요청할 때 localhost 를 사용할 수 없습니다.
// IP 주소를 찾아서 입력하거나, (cmd창에서 ipconfig 명령으로 확인 : 192.168.xxx.xxx)
// 에뮬레이터를 이용하는 경우에는 에뮬레이터용 IP 주소(10.0.2.2)를 사용합니다.
import 'dart:convert';

import 'package:l_with_springboot/product/Product.dart';
import 'package:http/http.dart' as http;

class ProductAPIService {

  final String baseUrl = "http://10.0.2.2:8080/api/products";   // Spring Boot API 서버

  Future<Product> registProduct(Product product) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),            // product -> Map -> JSON 문자열
    );

    if(response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));   // JSON 문자열 -> Map -> product
    } else {
      throw Exception("Failed to regist product");
    }
  }

  Future<List<Product>> getProductList() async {
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200) {
      final List<dynamic> list = json.decode(response.body);  // JSON 문자열 -> List<dynamic> (json.decode 메소드는 dynamic 타입을 반환함)
      return list.map((jsonProduct) => Product.fromJson(jsonProduct)).toList();
      // 위의 코드 동작 순서
      // list : [ { }, { }, ... ]
      // jsonProduct : { }
      // Product.fromJson(jsonProduct) : { } -> Product
      // .toList() : [ Product, Product, ... ]
    } else {
      throw Exception("Failed to get product list");
    }
  }

  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if(response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));  // JSON 문자열 -> Map -> product
    } else {
      throw Exception("Failed to get product");
    }
  }

  Future<Product> modifyProduct(Product product) async {
    final response = await http.put(Uri.parse(
      "$baseUrl/${product.id}"),
      body: json.encode(product.toJson()),    // product -> Map -> JSON 문자열
      headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));  // JSON 문자열 -> Map -> product
    } else {
      throw Exception("Failed to modify product");
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if(response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }

}