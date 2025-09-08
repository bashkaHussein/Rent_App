import 'package:flutter/material.dart';

class Shopscreen extends StatefulWidget {
  final String name;
  final double rating;
  final String image;

  const Shopscreen({
    super.key,
    required this.name,
    required this.rating,
    this.image = 'assets/shop_owner.jpg',
  });

  @override
  State<Shopscreen> createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark theme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Shop Owner Image
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(widget.image),
          ),
          const SizedBox(height: 12),
          // Shop Name & Location
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Royal Ln. Mesa, New Jersey",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(Icons.chat_bubble, Colors.purple),
              const SizedBox(width: 16),
              _buildActionButton(Icons.map, Colors.green),
            ],
          ),
          const SizedBox(height: 20),

          // Shop Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatBox("20 customers"),
              _buildStatBox("${widget.rating} reviews"),
              _buildStatBox("7 items"),
            ],
          ),
          const SizedBox(height: 20),

          // Reviews Section
          _buildReview(
            name: "John Smith",
            status: "Excellent",
            review: "Very good prices! I love it!",
            rating: 5.0,
            color: Colors.green,
          ),
          _buildReview(
            name: "Samantha Bauer",
            status: "Great",
            review: "I rent a chair and it was quite old, un...",
            rating: 4.0,
            color: Colors.purple,
          ),
          _buildReview(
            name: "Alexander Wang",
            status: "Excellent",
            review: "Hurrison is a polite and friendly so l...",
            rating: 5.0,
            color: Colors.green,
          ),
          _buildReview(
            name: "Lisa Morris",
            status: "Bad",
            review: "Hurrison didn’t answer me!",
            rating: 2.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildStatBox(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildReview({
    required String name,
    required String status,
    required String review,
    required double rating,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/user.jpg"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: TextStyle(color: color),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.star, color: color, size: 18),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(color: color, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  review,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
