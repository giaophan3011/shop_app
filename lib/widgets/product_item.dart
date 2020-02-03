import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products.dart';
import '../app_routes.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Products>(context).products;
    print (list.length);
    print(imageUrl);
    return InkResponse(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.product_detail_screen,
          arguments: {
            'id': id,
          },
        );
      },
      child: GridTile(
        child: Image.network(imageUrl),
        footer: GridTileBar(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: null,
          ),
          backgroundColor: Colors.grey,
          trailing: IconButton(
            icon: Icon(Icons.shopping_basket),
            color: Theme.of(context).accentColor,
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
