import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class CartItem extends StatelessWidget {
  final Product item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: ListTile(
        leading: CircleAvatar(child: Text(item.price.toString()),),
        title: Text(item.title),
        
      
      ),
    );
  }
}
