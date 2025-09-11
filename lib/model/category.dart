import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    this.color = const Color.fromARGB(255, 201, 67, 178),
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"] ?? "",
      name: json["Name"] ?? "",
      description: json["Description"] ?? "",
      images: List<String>.from(json["Image"] ?? []),
      createdAt: DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? "") ?? DateTime.now(),
    );
  }
}
