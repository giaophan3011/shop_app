import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../app_routes.dart';
import '../provider/shopping_cart.dart';
import '../appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart' as actions;

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  final Product item;
  ProductItem(this.item);
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    print('build start ');
    //final item = Provider.of<Product>(context, listen: true);
    //final shoppingCart = Provider.of<ShoppingCart>(context, listen: true);
    print('rebuild');
    return InkResponse(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.product_detail_screen,
          arguments: {
            'id': item.id,
          },
        );
      },
      child: GridTile(
        child: Image.network(item.imageUrl),
        footer: GridTileBar(
          title: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          leading: IconButton(
            // key: Key(item.id),
            icon: Icon(Icons.favorite),
            color: item.isFavorite == null || false
                ? Colors.grey
                : Theme.of(context).accentColor,
            onPressed: () {
              bool input = item.isFavorite == null ? true : !item.isFavorite;
              print(input);
              item.toggleFavorite(input);
            },
          ),
          backgroundColor: Colors.black,
          trailing: StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              // Return a `VoidCallback`, which is a fancy name for a function
              // with no parameters. It only dispatches an Increment action.
              return () => store.dispatch(actions.AddItemToCart(item));
            },
            builder: (context, testdummy) {
              return IconButton(
                icon: Icon(Icons.shopping_basket),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  testdummy();
                  /* showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text("Test"),
                      );
                    },
                  ); */
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(
                        seconds: 1,
                      ),
                      content: Text('Item has been added to the cart'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
