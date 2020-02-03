import '../models/product.dart';
import 'package:flutter/material.dart';
class ShoppingCart extends ChangeNotifier{
  List<Product> _cartItems = [];
  List<Product> get cartItems {
    return [..._cartItems];
  }

  void addItem (Product value) {
    _cartItems.add(value);
  }
}