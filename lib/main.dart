/*
import 'package:flutter/material.dart';

import 'screens/productsOverviewScreen.dart';
import 'screens/productDetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Simma', home: ProductsOverviewScreen(), routes: {
      ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
    });
  }
}
*/
// main.dart
import 'package:flutter/material.dart';
import './pages/homePage.dart';
import './pages/productInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Simma',
      home: HomePage(),
      routes: {
        ProductInfo.routeName: (ctx) => ProductInfo(),
      },
    );
  }
}
