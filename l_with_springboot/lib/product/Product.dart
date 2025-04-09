class Product {

  final int? id;    // 상품 등록 시 id 는 값이 없는 상태로 Product 이 생성됨
  final String name;
  final int price;
  final String description;

  Product({ this.id, required this.name, required this.price, required this.description });

  // JSON to Product
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      price: map["price"],
      description: map["description"],
    );
  }

  // Product to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "description": description,
    };
  }

}