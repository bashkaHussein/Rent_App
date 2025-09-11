import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/products.dart';
import '../model/shop.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final String _appKey = "YOUR_APP_KEY";
  final String _baseUrl = "http://10.111.10.50:5000/api"; // Emulator localhost
  /// Fetch products and their shop info
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
      debugPrint("Body: ${response.body}");
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        // Handle both List and Map responses
        final List<dynamic> data = decoded is List
            ? decoded
            : (decoded['data'] ?? decoded['products'] ?? []);
        List<Product> tempProducts = [];
        for (var item in data) {
          Shop? shop;
          if (item['ShopId'] != null) {
            final shopResp = await http.get(
              Uri.parse("$_baseUrl/Get-Shop/${item['ShopId']}"),
              headers: {
                'Content-Type': 'application/json',
                'x-app-key': _appKey,
              },
            );
            if (shopResp.statusCode == 200) {
              final shopJson = jsonDecode(shopResp.body);
              shop = Shop.fromJson(shopJson);
            }
          }

          tempProducts.add(Product.fromJson(item));
        }
        _products = tempProducts;
      } else {
        debugPrint("Failed to fetch products: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
