class Product {
  final String name;
  final String image;
  final double price;
  final String shop;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.shop,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    name: json['name'],
    image: json['image'],
    price: double.tryParse(json['price'].toString()) ?? 0.0,
    shop: json['shop'],
  );
}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'shop': shop,
    };
  }

}
