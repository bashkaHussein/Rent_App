import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:renting_app/data/category.dart';
import 'package:renting_app/data/products.dart';
import 'package:renting_app/screens/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedInedex = 0;
  final List<Widget> _pages = [homescreen(), homescreen()];

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
      body: ListView(
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
                // Categories
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        height: double.maxFinite,
                        width: 90,
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image(
                                image: AssetImage(category.image),
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              category.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          ),

          // Lease Again section
          Container(
            margin: const EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Padding(
                  padding: const EdgeInsets.all(16),
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
                    itemBuilder: (countext, index) {
                      final product = products[index];
                      return SizedBox(
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
                                  image: AssetImage(product.image),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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

                            // Product name
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
                            // Price
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
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: products.length,
                  ),
                ),

                // Available Now
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Available Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Product card fixed alignment
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xffF1EEF4),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage('assets/drill.png'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // name + favorite
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Craftsman Cordless Drill',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(Icons.favorite_outline),
                                    ],
                                  ),
                                  const SizedBox(height: 6),

                                  // location + price + rating
                                  Row(
                                    children: const [
                                      Icon(IconlyLight.location, size: 18),
                                      SizedBox(width: 4),
                                      Text('4.0km'),

                                      SizedBox(width: 16),
                                      Text(
                                        '\$5.00 / hr',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),

                                      SizedBox(width: 16),
                                      Icon(IconlyLight.star, size: 18),
                                      SizedBox(width: 4),
                                      Text('4.99'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurpleAccent.shade400,
        animationDuration: const Duration(milliseconds: 1),
        items: const [
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.favorite, color: Colors.white, size: 30),
          Icon(Icons.search, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}
