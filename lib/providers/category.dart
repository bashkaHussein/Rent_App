import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  final String _appKey = "YOUR_APP_KEY";
  final String _baseUrl = "http://10.111.10.50:5000/api"; // Emulator localhost

  /// Fetch categories from API
  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/Get-categorys"),
        headers: {
          'Content-Type': 'application/json',
          'x-app-key': _appKey,
        },
      );

      debugPrint("Category Body: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        // Haddii API uu soo celiyo Map ama List hubi
        final List<dynamic> data =
            decoded is List ? decoded : (decoded['data'] ?? []);

        List<Category> tempCategories = [];

        for (var item in data) {
          tempCategories.add(Category.fromJson(item));
        }

        _categories = tempCategories;
      } else {
        debugPrint("Failed to fetch categories: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching categories: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
