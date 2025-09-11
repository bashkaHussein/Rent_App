import 'dart:io'; // <-- Added for HttpOverrides
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renting_app/providers/category.dart';
import 'package:renting_app/providers/product.dart';
import 'package:renting_app/screens/homescreen.dart';

void main() {
  // Add this to bypass certificate errors in debug mode
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()), // ✅
      ],
      child: const MyApp(),
    ),
  );
}

// Custom HttpOverrides class to allow self-signed certificates (debug only)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
