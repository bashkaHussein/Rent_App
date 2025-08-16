import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:renting_app/data/category.dart';

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
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Find the Best Rent',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 110, // increased to give room for image + text
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        height: double.maxFinite,
                        width: 90,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded( // ✅ prevents overflow
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
        ],
      ),
    );
  }
}
