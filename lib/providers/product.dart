import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/products.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final String _appKey = "YOUR_APP_KEY";
  final String _baseUrl =
      "http://192.168.137.162:5000/api"; // Emulator localhost

  /// Fetch products from API
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/Get-Products"),
        headers: {
          'Content-Type': 'application/json',
          'x-app-key': _appKey,
        },
      );

      debugPrint("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        // Auto-handle wrapped data key
        final List<dynamic> data = decoded is List
            ? decoded
            : (decoded['data'] ?? decoded['products'] ?? []);

        _products = data.map((item) => Product.fromJson(item)).toList();

        debugPrint("Fetched ${_products.length} products:");
        for (var p in _products) {
          debugPrint(
              "Product: ${p.name}, Price: ${p.price}, Image: ${p.image}");
        }
      } else {
        debugPrint("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Create a new product via API
  Future<bool> createProduct(Product product) async {
    try {
      final uri = Uri.parse("$_baseUrl/Create-Product");
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'x-app-key': _appKey,
        },
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final created = Product.fromJson(data['product'] ?? data);
        _products.add(created);
        notifyListeners();
        return true;
      } else {
        debugPrint('Create failed: ${response.statusCode} ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Create error: $e');
      return false;
    }
  }
}
