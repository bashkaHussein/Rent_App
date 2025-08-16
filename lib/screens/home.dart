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
        title: ActionChip(label: Text("Bashir Hussein"),
        shape: StadiumBorder(),
        backgroundColor: Color(0xff272b30),
        labelStyle: TextStyle(color: Colors.white),
        side: BorderSide.none,
        avatar: Icon(IconlyLight.location),
        onPressed: (){},
        ),
      ),
      body: ListView(
        
      ),
    );
  }
}
