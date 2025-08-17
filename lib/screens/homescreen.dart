import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:renting_app/data/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151617),
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(IconlyLight.search),
        backgroundColor: Color(0xff151617),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              alignment: Alignment(1, -1.07),
              backgroundColor: Color(0xff724cf6),
              child: Icon(IconlyLight.notification),
            ),
          ),
        ],
        title: ActionChip(
          shape: StadiumBorder(),
          backgroundColor: Color(0xff272b30),
          labelStyle: TextStyle(color: Colors.white),
          label: Text('Mogadisho'),
          side: BorderSide.none,
          avatar: Icon(IconlyLight.location, color: Colors.white),
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
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return (Container(
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
                            SizedBox(height: 10),
                            Text(
                              category.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ));
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 12),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lease Again',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Text('See More'),
                        label: Icon(IconlyLight.arrowRight2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (countext, index) {
                      return SizedBox(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //image
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.maxFinite,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage('assets/tablet.png'),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
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
                                        icon: Icon(Icons.favorite),
                                        padding: EdgeInsets.zero,
                                        iconSize: 18,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //icon
                                        Icon(IconlyLight.star, size: 20),
                                        SizedBox(width: 10),
                                        Text('7.1'),

                                        //text
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Google Pixel Tablet',
                                style: TextStyle(
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
                                    text: '\$17.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black, // don’t forget color
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
                    separatorBuilder: (context, index) => SizedBox(width: 15),
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
