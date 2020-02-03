import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

import '../widgets/product_item.dart';



class ProductsOverviewScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body:  GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => 
                ProductItem(
                  loadedProducts[i].id,
                  loadedProducts[i].title,
                  loadedProducts[i].imageUrl,
                )
              ,
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
