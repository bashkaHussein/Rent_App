// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:renting_app/data/products.dart';
// import 'package:renting_app/screens/shopscreen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ProductsScreen extends StatefulWidget {
//   const ProductsScreen({super.key, required this.product});

//   final Product product;
//   @override
//   State<ProductsScreen> createState() => _ProductsState();
// }

// class _ProductsState extends State<ProductsScreen> {
//   int activeIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final String shopName = "Bashir's Shop";
//     final double shopRating = 8.99;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.product.name),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.favorite),
//               style: IconButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 223, 217, 217),
//                   foregroundColor: Colors.deepPurpleAccent),
//             ),
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 200,
//             child: PageView.builder(
//                 itemCount: 4, // Use widget.product.images.length if available
//                 onPageChanged: (index) {
//                   setState(() {
//                     activeIndex = index;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: double.maxFinite,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     padding: EdgeInsets.all(8),
//                     alignment: Alignment.bottomLeft,
//                     decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             image: AssetImage(widget.product.image))),
//                     child: Row(
//                       children: [
//                         // km Tag
//                         Container(
//                           margin: const EdgeInsets.only(right: 8),
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 4,
//                             horizontal: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurpleAccent,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on_outlined,
//                                 color: Colors.white,
//                                 size: 16,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 '3.5km',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Availability Tag
//                         Container(
//                           margin: const EdgeInsets.only(right: 8),
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 4,
//                             horizontal: 10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Text(
//                             'Available',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         // Rating Tag
//                         const Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               color: Colors.deepPurpleAccent,
//                               size: 20,
//                             ),
//                             SizedBox(width: 4),
//                             Text(
//                               '8.9',
//                               style: TextStyle(
//                                 color: Colors.deepPurpleAccent,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: AnimatedSmoothIndicator(
//               activeIndex: activeIndex,
//               count: 3,
//               effect: ExpandingDotsEffect(
//                 dotColor: Colors.grey,
//                 activeDotColor: Color(0xff794AFE),
//                 dotHeight: 8,
//                 dotWidth: 8,
//                 expansionFactor: 4,
//               ),
//             ),
//           ),
//           ListTile(
//               leading: CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colors.grey,
//                   backgroundImage: AssetImage('assets/wiil.jpg')),
//               title: Text(
//                 'Bashir\'s Shop',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Row(
//                 children: [
//                   ...List.generate(
//                     4,
//                     (index) => Icon(
//                       IconlyBold.star,
//                       color: Color(0xff794AFE),
//                       size: 20,
//                     ),
//                   ),
//                   Icon(
//                     IconlyBold.star,
//                     color: Colors.grey,
//                     size: 20,
//                   ),
//                   SizedBox(width: 6),
//                   Text('8.99')
//                 ],
//               ),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Shopscreen(
//                       name: shopName,
//                       rating: shopRating,
//                       image: widget.product.image,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           Padding(
//             padding: const EdgeInsets.all(17),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: Colors.grey.shade400),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Houry',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 9.0),
//                             child: Text(
//                               '\$40',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text(
//                             '/Hour',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                      Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: Colors.grey.shade400),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Houry',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 9.0),
//                             child: Text(
//                               '\$40',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text(
//                             '/Hour',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                      Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: Colors.grey.shade400),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Houry',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 9.0),
//                             child: Text(
//                               '\$40',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text(
//                             '/Hour',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ListTile(
//               tileColor:Color(0xffeadeff),
//               leading: Icon(Icons.calendar_month, color: Color.fromARGB(255, 115, 63, 255),),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10)
//               ),
//               title: Text('4 Month', style: TextStyle(color: Color(0xff794AFE), fontSize: 20),
//             ),
//           )
//           )
//         ],
//       ),
//     );
//   }
// }
