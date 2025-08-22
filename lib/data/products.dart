class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});
}

List<Product> products = [
  Product(name: 'Baaskiil', image: 'assets/cycle.png', price: 29.99),
  Product(name: 'Tablet', image: 'assets/tablet.png', price: 49.99),
  Product(name: 'Teendo', image: 'assets/tent.png', price: 19.99),
];
