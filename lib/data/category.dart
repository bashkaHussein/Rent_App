import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  final Color color; // <-- FIX: use Color type

  Category({
    required this.name,
    required this.image,
    required this.color,
  });
}

List<Category> categories = [
  Category(
    name: "Sports",
    image: "assets/cycle.png",
    color: const Color(0xffc2f6bf),
  ),
  Category(
    name: "Electronic",
    image: "assets/fridge.png",
    color: const Color(0xffc8a0f1),
  ),
  Category(
    name: "Fitness",
    image: "assets/fitness.png",
    color: const Color(0xfff5c385),
  ),
  Category(
    name: "Tools",
    image: "assets/screwdriver.png",
    color: const Color(0xfff19baa),
  ),
  Category(
    name: "Grocery",
    image: "assets/utensils.png",
    color: Colors.orange,
  ),
];
