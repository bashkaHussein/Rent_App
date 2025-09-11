import 'package:renting_app/model/shop.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> image;
  final Shop? shop;
  final String? status;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.shop,
    this.status,
  });

factory Product.fromJson(Map<String, dynamic> json) {
  // Parse embedded shop
  Shop? shop;
  final shopJson = json['ShopId'];
  if (shopJson != null && shopJson is Map<String, dynamic>) {
    shop = Shop.fromJson(shopJson);
  }

  return Product(
    id: json['_id'] ?? '',
    name: json['Name'] ?? 'Unknown Product',
    description: json['Description'] ?? '',
    price: double.tryParse(json['Price'].toString()) ?? 0.0,
    image: (json['Image'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [],
    shop: shop,
    status: json['Status'] ?? 'Unknown',
  );
}


  @override
  String toString() {
    return '''
Product(
  id: $id,
  name: $name,
  description: $description,
  price: $price,
  images: $image,
  shop: ${shop?.name ?? 'No Shop'},
  status: $status
)''';
  }
}
