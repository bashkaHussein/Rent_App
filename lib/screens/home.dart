import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
                  height: 98,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Container(
                        height: double.maxFinite,
                        width: 90,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(18)
                        ),
                        child: Column(
                          children: [
                            //category image


                            //category name
                          ],
                        ),
                      );

                    },
                    separatorBuilder: (context, index)=> SizedBox(width: 10,),
                    itemCount: 8,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
