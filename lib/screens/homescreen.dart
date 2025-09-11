import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:renting_app/model/category.dart';
import 'package:renting_app/providers/category.dart' show CategoryProvider;
import 'package:renting_app/providers/product.dart';
import 'package:renting_app/screens/productDetail.dart';
import 'package:renting_app/screens/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String baseUrl = "http://10.111.10.50:5000"; // Your backend root
  int _currentIndex = 0; // Added for bottom navigation tracking

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductProvider>(context, listen: false).fetchProducts());
    Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151617),
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(IconlyLight.search),
        backgroundColor: const Color(0xff151617),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              alignment: const Alignment(1, -1.07),
              backgroundColor: const Color(0xff724cf6),
              child: const Icon(IconlyLight.notification),
            ),
          ),
        ],
        title: ActionChip(
          shape: const StadiumBorder(),
          backgroundColor: const Color(0xff272b30),
          labelStyle: const TextStyle(color: Colors.white),
          label: const Text('Mogadisho'),
          side: BorderSide.none,
          avatar: const Icon(IconlyLight.location, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, _) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (value.products.isEmpty) {
            return const Center(
              child: Text(
                'No products available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Find The Best Rent',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    // Categories Section
                    SizedBox(
                      height: 110,
                      child: Consumer<CategoryProvider>(
                        builder: (context, categoryProvider, _) {
                          if (categoryProvider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (categoryProvider.categories.isEmpty) {
                            return const Center(
                              child: Text(
                                "No categories available",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryProvider.categories.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final category =
                                  categoryProvider.categories[index];
                              return Container(
                                height: double.maxFinite,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: category
                                      .color, // random / predefined color
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: category.images.isNotEmpty
                                          ? Image.network(
                                              category.images.first,
                                              fit: BoxFit.contain,
                                            )
                                          : const Icon(Icons.category,
                                              size: 40,
                                              color: Color.fromARGB(
                                                  255, 0, 167, 218)),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      category.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Lease Again section
              Container(
                height: 600,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lease Again',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text('See More'),
                            label: const Icon(IconlyLight.arrowRight2),
                          ),
                        ],
                      ),
                    ),

                    // Horizontal product list
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.products.length,
                        itemBuilder: (context, index) {
                          final product = value.products[index];

                          String imageUrl = product.image.isNotEmpty
                              ? product.image[0]
                              : 'https://via.placeholder.com/150';

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: product),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 130,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // image
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    width: double.maxFinite,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: product.image.isNotEmpty
                                            ? NetworkImage(imageUrl)
                                            : const AssetImage(
                                                    'assets/images/placeholder.png')
                                                as ImageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: IconButton.filledTonal(
                                              onPressed: () {},
                                              icon: const Icon(Icons.favorite),
                                              padding: EdgeInsets.zero,
                                              iconSize: 18,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Icon(IconlyLight.star, size: 20),
                                              SizedBox(width: 6),
                                              Text('7.1'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '\$${product.price}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' /hr',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Available Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Loop through API product (example: first product)
                          if (value.products.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: const Color(0xffF1EEF4),
                              ),
                              child: Row(
                                children: [
                                  // Product image
                                  Container(
                                    width: 55,
                                    height: 55,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Image.network(
                                      value.products[0].image.isNotEmpty
                                          ? value.products[0].image[0]
                                          : 'https://via.placeholder.com/50',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Product details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Product name
                                        Text(
                                          value.products[0].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),

                                        // Description or category
                                        Text(
                                          value.products[0].description
                                                  .isNotEmpty
                                              ? value.products[0].description
                                              : 'Available for immediate rent',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 6),

                                        // Rating and price
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                size: 16, color: Colors.orange),
                                            const SizedBox(width: 4),
                                            Text(
                                              '4.8', // Can replace with actual rating if available
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '\$${value.products[0].price}/hr',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            const Center(
                              child: Text(
                                'No available products',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _currentIndex = 2);
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, size: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.apps,
                  color: _currentIndex == 0 ? Colors.purple : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 0),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border,
                  color: _currentIndex == 1 ? Colors.purple : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 1),
            ),
            const SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: Icon(Icons.chat_bubble_outline,
                  color: _currentIndex == 3 ? Colors.purple : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 3),
            ),
            IconButton(
              icon: Icon(Icons.person_outline,
                  color: _currentIndex == 4 ? Colors.purple : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 4),
            ),
          ],
        ),
      ),
    );
  }
}
