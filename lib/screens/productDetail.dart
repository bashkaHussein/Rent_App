import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../model/products.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController _pageController = PageController();
  int activeIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
     // Daabac shop name-ka
       debugPrint("Product: $product");

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.deepPurpleAccent,
              shape: const StadiumBorder(),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Product Images
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: product.image.isNotEmpty ? product.image.length : 1,
              onPageChanged: (index) => setState(() => activeIndex = index),
              itemBuilder: (context, index) {
                String imgUrl = product.image.isNotEmpty
                    ? product.image[index]
                    : 'https://via.placeholder.com/150';
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: (product.status?.toLowerCase() == 'available')
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        product.status ?? 'Unknown',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: product.image.isNotEmpty ? product.image.length : 1,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.deepPurpleAccent,
                dotColor: Colors.grey,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: Text(
              
              product.shop?.name?? 'Shop', // ✅ Correct lowercase 'name'
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                ...List.generate(4,
                    (index) => const Icon(IconlyBold.star, color: Colors.deepPurpleAccent)),
                const Icon(IconlyBold.star, color: Colors.grey),
                const SizedBox(width: 5),
                const Text('7.8'),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
              color: Colors.deepPurpleAccent,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPriceCard('Hourly', '\$5.99', '/Hour'),
                buildPriceCard('Daily', '\$50.99', '/Day'),
                buildPriceCard('Monthly', '\$200.99', '/Month'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.calendar_month, color: Color(0xff7340ff)),
              title: const Text(
                '6 Month',
                style: TextStyle(color: Color(0xff7340ff), fontWeight: FontWeight.w600),
              ),
              trailing: const Text('Set Dates', style: TextStyle(color: Color(0xff7340ff))),
              tileColor: const Color(0xffeadeff),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff794afe),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Lease Now',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildPriceCard(String title, String price, String period) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(period, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
