import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:renting_app/data/category.dart';
import 'package:renting_app/data/products.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151617),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff151617),
        foregroundColor: Colors.white,
        leading: Icon(IconlyLight.search),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              alignment: Alignment(1, -1.5),
              backgroundColor: Color(0xff724cf6),
              child: Icon(IconlyLight.notification),
            ),
          ),
        ],
        title: ActionChip(
          label: Text("Muqdisho"),
          shape: StadiumBorder(),
          backgroundColor: Color(0xff272b30),
          labelStyle: TextStyle(color: Colors.white),
          side: BorderSide.none,
          avatar: Icon(IconlyLight.location),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                SizedBox(
                  height: 110, // increased to give room for image + text
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        height: double.maxFinite,
                        width: 90,

                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              // ✅ prevents overflow
                              child: Image.asset(
                                category.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 6), // ✅ spacing
                            Text(
                              category.name,
                              maxLines: 1, // ✅ keep text on one line
                              overflow: TextOverflow.ellipsis, // ✅ safe cut
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Our Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        label: Icon(IconlyLight.arrowDown2),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: 9,
                    ),
                  ),
                ),

           
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple.shade700,
        animationDuration: Duration(milliseconds: 10),

        items: [
          Icon(IconlyLight.home, color: Colors.white),
          Icon(IconlyLight.heart, color: Colors.white),
          Icon(IconlyLight.search, color: Colors.white),
          Icon(IconlyLight.setting, color: Colors.white),
        ],
      ),
    );
  }
}
