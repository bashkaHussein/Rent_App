import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:renting_app/data/products.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController _pageController = PageController();
  int activeIndex = 0; // Moved here

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
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
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4, // Use widget.product.images.length if available
              onPageChanged: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  height: 400,
                  // width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.product.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Row(
                    children: [
                      // km Tag
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '3.5km',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Availability Tag
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Available',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // Rating Tag
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepPurpleAccent,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '8.9',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.deepPurpleAccent,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/58/b0/75/58b07594b67c68652c9faab6c9e68201.jpg'),
            ),
            trailing: IconButton.filledTonal(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.deepPurpleAccent,
                )),
            title: Text(
              'Kaamilshop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Row(
              children: [
                ...List.generate(
                  4,
                  (index) => Icon(
                    IconlyBold.star,
                    size: 20,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Icon(IconlyBold.star, size: 20),
                SizedBox(width: 5),
                Text('7.8')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //card one
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hourly',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '\$5.99',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('/Hour',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),

                    //card two
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Daily',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '\$50.99',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('/Day',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),

                    /// card three

                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mothly',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '\$40.99',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('/Month',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month, color: Color.fromARGB(255, 115, 63, 255),),
                  tileColor:Color(0xffeadeff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: const Text(
                    '6 Month',
                    style: TextStyle(
                      color: Color.fromARGB(255, 115, 63, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Text('Set Dates', style: TextStyle(color: Color.fromARGB(255, 115, 63, 255), fontSize: 16),),
                  onTap: () {
                    // Add your action here (e.g., navigate or select)
                  },
                ),
                SizedBox(height: 10,)
                ,
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: FilledButton(onPressed: (){}, 
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xff794afe),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: Text('Lease for \$70', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
                )              ],
            ),
          )
        ],
      ),
    );
  }
}
