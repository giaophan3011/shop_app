import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/appState.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/provider/products.dart';

import '../actions/actions.dart' as actions;
import '../app_routes.dart';
import '../provider/products.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> _dropdownMenuItem = [
      "Add product",
    ];
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.products;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.add_product_screen,
            );
          },
        ),
        title: Text('My Shop'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.cart_screen,
              );
            },
          ),
        ],
      ),
      body: new StoreConnector<AppState, List<Product>>(
        converter: (store) => store.state.products.toList(),
        builder: (context, loadedProducts) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: loadedProducts.length,
            itemBuilder: (ctx, i) => ProductItem(loadedProducts[i]),
            gridDelegate:
                //SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2 / 3),
          );
        },
      ),
      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(actions.DisplayListOnlyAction());
        },
        builder: (context, testdummy) {
          return new FloatingActionButton(
            // Attach the `callback` to the `onPressed` attribute
            onPressed: testdummy,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),
    );
  }
}
