class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image; // Base64 string

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
      price: (json['Price'] != null)
          ? double.tryParse(json['Price'].toString()) ?? 0.0
          : 0.0,
      image: (json['Image'] != null && (json['Image'] as List).isNotEmpty)
          ? json['Image'][0]
          : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Name': name,
      'Description': description,
      'Price': price,
      'Image': [image],
    };
  }
}
