import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_app/providers/product.dart';
// import 'package:renting_app/screens/home.dart';
import 'package:renting_app/screens/homescreen.dart';

void main() {
  runApp(
    MultiProvider(
       providers: [
       ChangeNotifierProvider.value(value: ProductProvider())
       ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
