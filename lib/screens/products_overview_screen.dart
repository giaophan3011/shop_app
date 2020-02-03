import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/shopping_cart.dart';
import '../provider/products.dart';

import '../widgets/product_item.dart';
import 'package:shop_app/provider/products.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    builder: (ctx) => loadedProducts[i],
                    
                  ),
                  ChangeNotifierProvider(
                    builder: (ctx) => ShoppingCart(),
                   
                  ),
                ],
                child: ProductItem(),
              ),
          gridDelegate:
              //SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2 / 3)),
    );
  }
}
