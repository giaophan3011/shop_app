import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './app_routes.dart';
import 'package:provider/provider.dart';
import './provider/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        home: ChangeNotifierProvider(
          builder: (context) => Products(),
          child: ProductsOverviewScreen(),
        ),
        routes: {
          //AppRoutes.home_screen: (context) => ProductsOverviewScreen(),
          AppRoutes.product_detail_screen: (context) => ProductDetailScreen(),
        });
  }
}
