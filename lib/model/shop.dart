class Shop {
  final String id;
  final String name; // lowercase for Dart
  final String location;
  final String description;

  Shop({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['_id'] ?? '',
      name: json['Name'] ?? 'Shop Name', // Map API capital "Name" to lowercase
      location: json['Location'] ?? '',
      description: json['Description'] ?? '',
    );
  }
}
